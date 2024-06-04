public class PackAnimals extends FriendsOfHuman{
    
        private String type = "PackAnimals";

        public PackAnimals(int id, String klichka, Date date_of_bitrh, String type) {
            super(id, klichka, date_of_bitrh);
            this.type = type;
        }

        public String getType() {
            return type;
        }

        @Override
        public String toString() {
            return super.toString() + ", type=" + type;
        }

}
