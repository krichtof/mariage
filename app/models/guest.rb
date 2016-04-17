class Guest < ActiveRecord::Base
  attr_accessible :arriving, :arriving_day, :departing, :departing_day, :email, 
    :friday_dinner, :mobile, :name, :nb_castle_nights, :nb_children, :nb_nights, 
    :nb_people, :nogo, :saturday_lunch, :sunday_lunch, :sunday_dinner, :remark
    
  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, unless: :edited_by_admin?
  validates_uniqueness_of :mobile, allow_blank: true
  validates :nb_people, presence: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  
  before_create :generate_token
  
  TRAIN_ARRIVALS = [
    ['Marmande vendredi 24 à 17h40', 'marmande_ven_1740'],
    ['Marmande vendredi 24 à 18h43', 'marmande_ven_1843'],
    ['Marmande vendredi 24 à 19h23', 'marmande_ven_1923'],
    ['Marmande vendredi 24 à 19h48', 'marmande_ven_1948'],
    ['Marmande samedi 25 à 11h39', 'marmande_sam_1139'],
    ['Marmande samedi 25 à 13h56', 'marmande_sam_1356'],
    ['Marmande samedi 25 à 15h42', 'marmande_sam_1542'],
  ]

  PLANE_ARRIVALS = [
    ['Bergerac vendredi 24 à 22h20', 'bergerac_ven_2220'],
    ['Bergerac samedi 25 à 10h35', 'bergerac_sam_1035'],
  ]
    
  CAR_ARRIVALS = [
    ['Arrivée prévue vendredi à partir de 17h', 'car_ven_pm'],
    ['Arrivée prévue samedi matin', 'car_sam_am'],
    ['Arrivée prévue samedi après-midi avant 16h30', 'car_sam_pm'],
    
  ]

  ARRIVALS = {
    'En voiture' => CAR_ARRIVALS,
    'Par train' => TRAIN_ARRIVALS, 
#    'Par avion' => PLANE_ARRIVALS
  }  


  TRAIN_DEPARTURES = [
    ['Marmande dimanche 26 à 9h21', 'marmande_dim_0921'],
    ['Marmande dimanche 26 à 11h13', 'marmande_dim_1113'],
    ['Marmande dimanche 26 à 11h40', 'marmande_dim_1140'],
    ['Marmande dimanche 26 à 13h52', 'marmande_dim_1352'],
    ['Marmande dimanche 26 à 15h18', 'marmande_dim_1518'],
    ]

  PLANE_DEPARTURES = [
    ['Bergerac dimanche 26 à 17h55', 'bergerac_dim_1755'],
    ['Bergerac lundi 26 à 17h55', 'bergerac_lun_1755'],
    ]

  CAR_DEPARTURES = [
    ['Départ prévu dimanche matin', 'car_sun_am'],
    ['Départ prévu dimanche après-midi', 'car_sun_pm'],
    ['Départ prévu dimanche soir', 'car_sun_night'],

  ]

  DEPARTURES = {
    'En voiture' => CAR_DEPARTURES,
    'Par train' => TRAIN_DEPARTURES, 
#    'Par avion' => PLANE_DEPARTURES    
  }
  def edited_by_admin?
    email == "simon.alexandra@gmail.com"
  end
  
  def arriving_by_car?
    !arriving_by_train? && !arriving_by_plane?
  end
  
  def arriving_by_train?
    ! arriving.match("marmande").nil? if arriving
  end
  
  def arriving_by_plane?
    ! arriving.match("bergerac").nil? if arriving
  end

  def departing_by_car?
    !departing_by_train? && !departing_by_plane?
  end
  
  def departing_by_train?
    ! departing.match("marmande").nil? if departing
  end
  
  def departing_by_plane?
    ! departing.match("bergerac").nil? if departing
  end

  
  def eat?
    friday_dinner || saturday_lunch || sunday_dinner
  end
  
  def eat_display
    eat_choices = [:friday_dinner, :saturday_lunch, :sunday_dinner]
    eat_array = []
    for i in eat_choices do
      eat_array.append I18n.t(i, scope: 'activerecord.attributes.guest').downcase if self.send i
    end
    choices = eat_array.join(', ')
    ['avec ', choices].join if choices
  end
  
  def to_param
    token
  end
  
  private
  def generate_token
    self.token = loop do
      random_token = SecureRandom.hex(12)
      break random_token unless self.class.exists?(token: random_token)
    end
  end
end
