use nashvillehousing;
SELECT * FROM nashville;
SELECT YEAR(SaleDate) as Saledate
FROM nashville;
//Convert datetime to Date
SELECT SaleDate, convert(SaleDate, date) as SaleDate
FROM nashville;
SET SQL_SAFE_UPDATES=0;
UPDATE nashville
SET SaleDate = convert(SaleDate, date) 
//Breaking out Address into individual columns (Address, city)
SELECT SUBSTRING(PropertyAddress, 1, LOCATE(',', PropertyAddress)-1) AS Address, 
SUBSTRING(PropertyAddress, LOCATE(',', PropertyAddress)+1) AS City
FROM nashville

ALTER TABLE nashville
ADD Address Nvarchar(100);
UPDATE nashville 
SET Address = SUBSTRING(PropertyAddress, 1, LOCATE(',', PropertyAddress)-1)

ALTER TABLE nashville
ADD City Nvarchar(100);
UPDATE nashville 
SET City = SUBSTRING(PropertyAddress, LOCATE(',', PropertyAddress)+1)

// CHANGE Y AND N TO YES AND NO IN 'SOLD AS VACANT'
SELECT SoldAsVacant, COUNT(*)
FROM nashville
GROUP BY SoldAsVacant

SELECT CASE WHEN SoldAsVacant = 'N' THEN 'No'
ELSE SoldAsVacant
END
FROM nashville

UPDATE nashville
SET SoldAsVacant = CASE WHEN SoldAsVacant = 'N' THEN 'No'
ELSE SoldAsVacant
END
