import 'package:flutter_test/flutter_test.dart';
import 'package:minefield/models/board.dart';

main() {
  test('WIN the game', () {
    Board board = Board(rows: 2, columns: 2, quantityOfBombs: 0);
    board.fields[0].toMine();
    board.fields[3].toMine();

    //playing...
    board.fields[0].toggleMark();
    board.fields[1].openBomb();
    board.fields[2].openBomb();
    board.fields[3].toggleMark();

    expect(board.solvedBoard, isTrue);
  });
}
