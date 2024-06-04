import java.sql.Date;

public class Horse extends PackAnimals{

    private AnimalEnum view = AnimalEnum.Horse;

    public Horse(int id, String klichka, Date date_of_bitrh, String type, AnimalEnum view) {
        super(id, klichka, date_of_bitrh, type);
        this.view = view;
    }

    public AnimalEnum getView() {
        return view;
    }

    @Override
    public String toString() {
        return super.toString() + ", view=" + view;
    }

}
