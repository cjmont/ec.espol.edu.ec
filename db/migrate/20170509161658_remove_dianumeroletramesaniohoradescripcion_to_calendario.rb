class RemoveDianumeroletramesaniohoradescripcionToCalendario < ActiveRecord::Migration
  def change
    remove_column :calendarios, :dianumero, :varchar
    remove_column :calendarios, :dialetra, :varchar
    remove_column :calendarios, :mes, :varchar
    remove_column :calendarios, :anio, :varchar
    remove_column :calendarios, :hora, :varchar
    remove_column :calendarios, :descripccion, :text
  end
end
