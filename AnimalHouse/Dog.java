
import java.sql.Date;

public class Dog extends Pets{

    private AnimalEnum view = AnimalEnum.Dog;

    public Dog(int id, String klichka, Date date_of_bitrh, String type, AnimalEnum view) {
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
