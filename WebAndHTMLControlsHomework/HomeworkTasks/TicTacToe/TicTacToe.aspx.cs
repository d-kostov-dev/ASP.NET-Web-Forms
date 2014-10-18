namespace HomeworkTasks.TicTacToe
{
    using System;
    using System.Text;
    using System.Web.UI;

    public partial class TicTacToe : System.Web.UI.Page
    {
        private static char[,] gameBoard;
        private static Random Random = new Random();
        private static char gameWinner;

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                gameBoard = new char[3, 3];
                this.InitField();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.successBox.Visible = false;
            this.errorBox.Visible = false;
        }

        protected void ButtonPlay_Click(object sender, EventArgs e)
        {
            var row = int.Parse(this.rowNum.Value) - 1;
            var col = int.Parse(this.colNum.Value) - 1;

            if (gameBoard[row, col] == 'e')
            {
                gameBoard[row, col] = 'x';
            }
            else
            {
                this.errorBox.Visible = true;
                return;
            }

            if (this.IsGameWon())
            {
                this.ShowWinner();
            }
            else
            {
                this.AIMove();

                if (this.IsGameWon())
                {
                    this.ShowWinner();
                }
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.DrawGameField();
        }

        private void DrawGameField()
        {
            StringBuilder fieldResult = new StringBuilder();

            for (int row = 0; row < 3; row++)
            {
                fieldResult.Append("<tr>");
                fieldResult.Append("<td>" + (row + 1) + "</td>");

                for (int col = 0; col < 3; col++)
                {
                    fieldResult.Append("<td><img src='/content/img/" + gameBoard[row, col] + ".png'/></td>");
                }

                fieldResult.Append("</tr>");
            }

            this.gameField.InnerHtml = fieldResult.ToString();
        }

        private void InitField()
        {
            for (int row = 0; row < 3; row++)
            {
                for (int col = 0; col < 3; col++)
                {
                    gameBoard[row, col] = 'e';
                }
            }
        }

        private void AIMove()
        {
            char currentPosValue;
            int row;
            int col;

            do
            {
                row = Random.Next(0, 3);
                col = Random.Next(0, 3);
                currentPosValue = gameBoard[row, col];
            } 
            while (currentPosValue != 'e');

            gameBoard[row, col] = 'o';
        }

        private bool IsGameWon()
        {
            // Check Horizontals
            for (int row = 0; row < 3; row++)
            {
                int count = 1;
                char prevSymbol = gameBoard[row, 0];

                for (int col = 1; col < 3; col++)
                {
                    if (gameBoard[row, col] == prevSymbol && prevSymbol != 'e')
                    {
                        count++;
                        prevSymbol = gameBoard[row, col];
                    }
                    else
                    {
                        break;
                    }
                }

                if (count == 3)
                {
                    gameWinner = prevSymbol;
                    return true;
                }
            }

            // Check Verticals
            for (int col = 0; col < 3; col++)
            {
                int count = 1;
                char prevSymbol = gameBoard[0, col];

                for (int row = 1; row < 3; row++)
                {
                    if (gameBoard[row, col] == prevSymbol && prevSymbol != 'e')
                    {
                        count++;
                        prevSymbol = gameBoard[row, col];
                    }
                    else
                    {
                        break;
                    }
                }

                if (count == 3)
                {
                    gameWinner = prevSymbol;
                    return true;
                }
            }

            // Check Diagonals
            if (gameBoard[0, 0] == gameBoard[1, 1] &&
                gameBoard[1, 1] == gameBoard[2, 2] &&
                gameBoard[1, 1] != 'e')
            {
                gameWinner = gameBoard[1, 1];
                return true;
            }

            if (gameBoard[0, 2] == gameBoard[1, 1] &&
                gameBoard[1, 1] == gameBoard[2, 0] &&
                gameBoard[1, 1] != 'e')
            {
                gameWinner = gameBoard[1, 1];
                return true;
            }

            return false;
        }

        private void ShowWinner()
        {
            this.successBox.Visible = true;

            if (gameWinner == 'x')
            {
                this.successBox.Controls.Add(new LiteralControl("<p>You Won</p>"));
            }
            else
            {
                this.successBox.Controls.Add(new LiteralControl("<p>Game Over - You Lost</p>"));
            }

            this.InitField();
        }
    }
}