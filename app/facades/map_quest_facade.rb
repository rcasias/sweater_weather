class MapQuestFacade
  def self.location(city, state)
    data = MapQuestService.get_location(city, state)
    MapQuest.new(data)
  end
end
