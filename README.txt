 - wszystkie katalogi problemów kończą się `-(pas|py[23]|c|cpp)`↓
	 - all problem directories end with ↑
 - poprzedzający wspomniane oznaczenie języka, poprzedzony `-`,
   rozpoczynający się od `[A-Z_]` to tytuł zadania. Występuje opcjonalnie.
   Składa się z `[a-z0-9A-Z_]`↓.
	 - preceding the aforementioned language marking, preceded with `-`,
	   starting with `[A-Z_]` is the problem title. Occurs optionally.
	   It contains of ↑.
 - wszystkie katalogi problemów rozpoczynają się nazwą kodową zadania,
   składającą się z `[a-z0-9A-Z_\-]`↓,
   nie rozpoczynającą się ani nie kończącą się `-`.
	 - all problem directories start with problem's codename,
	   containing of ↑,
	   neither starting nor ending with `-`.
 - katalogi rozpoczynające się od `build` są ignorowane.
	 - directories starting with `build` are ignored.
 - katalogi ukryte (kropka na początku) są ignorowane.
	 - hidden directories (starting with a period) are ignored.
 - wyznacznikiem katalogu głównego problemów jest obecność katalogu .management
	 - the determinant of the root problems directory is the presence
	   of the directory .management
 - w poszukiwaniu wyznacznika katalogu głównego sprawdza się ./ i ../
	 - in search of a determinant of the root problems directory
	   checked are ./ and ../
 - 
