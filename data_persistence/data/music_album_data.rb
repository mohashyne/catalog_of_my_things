require_relative '../file_helper'

module MusicAlbumData
  FILENAME = 'music_albums.json'.freeze

  include FileManager

  def read_all_albums(labels)
    data = read_file(file(FILENAME))
    data.map { |album| json_to_album(album, labels.find { |item| album['label']['id'] == item.id }) }
  end

  def save_album(albums)
    data = albums.map { |album| album_to_json(album) }
    write_file(file(FILENAME), data)
  end

  def album_to_json(album)
    {
      id: album.id,
      publish_date: album.publish_date,
      on_spotify: album.on_spotify,
      label: { id: album.label.id, title: album.label.title, color: album.label.color }
    }
  end

  def json_to_album(album_json, label)
    album = MusicAlbum.new(album_json['id'], album_json['publish_date'], album_json['on_spotify'])
    album.add_label(label)
    album
  end
end
