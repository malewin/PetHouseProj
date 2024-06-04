import java.util.Scanner;

public class Menu {

    private void start(){
    
        Scanner scanner = new Scanner(System.in);
        boolean statusSearch = true;

        while (statusSearch){

            int choice = scanner.nextInt();

            System.out.println("\u001B[34m"+"Меню: " + "\u001B[0m");
            System.out.println("\u001B[32m" + "Выберите пункт:\n1 - Создать таблицу в БД\n" +
                                "2 - Удалить таблицу из БД\n3 - Добавить животное в таблицу питомника\n" + 
                                "4 - Удалить животное из таблицы питомника\n5 - Показать всех животных из таблицы питомника\n" +
                                "6 - Показать животное по id\n7 - Добавить команду животному (по id)\n" + 
                                "8 - Выйти из меню: " + "\u001B[0m");
        
            switch (choice) {
                case 1: // создать таблицу в БД
                    System.out.println();
                
                    break;
            
                case 2: // удалить таблицу из БД

                    break;
            
                case 3: // добавить животное в таблицу питомника

                    break;
            
                case 4: // удалить животное из таблицы питомника

                    break;

                case 5: // показать всех животных из таблицы питомника

                    break;
                
                case 6: // показать животное по id

                    break;
                
                case 7: // добавить команду животному (по id)

                    break;
                
                case 8: // Выйти из меню
                    statusSearch = false;
                    break;
                default:
                    System.out.println("Такого пункта нет в меню");
                    return;
            }

        }

    }

    start();

}
