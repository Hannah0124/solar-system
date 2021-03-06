require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/planet'
require_relative '../lib/solar_system'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe '== Planet class (initialize) ==' do 

  it "takes a <name>, <color>, <mass_kg>, <distance_from_sun_km> and <fun_fact>" do 
    # Arrange 
    earth = Planet.new('Earth', 'blue-green', 150, 28.8, 'Only planet known to support life')
  
    # Act & Assert
    expect(earth).must_respond_to :name
    expect(earth).must_respond_to :color
    expect(earth).must_respond_to :mass_kg
    expect(earth).must_respond_to :distance_from_sun_km
    expect(earth).must_respond_to :fun_fact

    expect(earth.name).must_equal "Earth"   
    expect(earth.color).must_equal "blue-green"  
    expect(earth.mass_kg).must_equal 150.0
    expect(earth.distance_from_sun_km).must_equal 28.8
    expect(earth.fun_fact).must_equal 'Only planet known to support life'
  end 

  
  it "will raise an ArgumentError if mass or distance from sun is less than or equal to 0" do 

     # Arrange > Act > Assert
     expect{
      Planet.new('Earth', 'blue-green', 5.972e24, 0, 'Only planet known to support life')
     }.must_raise ArgumentError

     expect{
      Planet.new('Mars', 'red', -10, 1.496e8, 'test')
     }.must_raise ArgumentError
  end 
end 

describe "== <summary> method ==" do
  it "will return <Terminal::Table> as class for the <summary> method" do 

    # Arrange 
    earth = Planet.new('Earth', 'blue-green', 150, 28.8, 'Only planet known to support life')

    # Act & Assert
    expect(earth.summary).must_be_instance_of Terminal::Table
  end 
end 