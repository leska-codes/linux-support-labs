#!/bin/bash

# Лабораторная работа №2
# Проект: ByteForge
# Тема: Управление правами доступа к файлам и каталогам Linux

# ==========================================
# Часть 1. Защита технического отчёта
# ==========================================

# Создаём файл технического отчёта
touch /home/olga/release_report.txt

# Назначаем владельца и группу
sudo chown olga:support /home/olga/release_report.txt

# Устанавливаем права: владелец — чтение и запись,
# группа — только чтение, остальные — без доступа
sudo chmod 640 /home/olga/release_report.txt

# Проверяем результат
ls -l /home/olga/release_report.txt


# ==========================================
# Часть 2. Разделение рабочих каталогов
# ==========================================

# Создаём структуру каталогов компании
sudo mkdir -p /opt/byteforge/support
sudo mkdir -p /opt/byteforge/analytics
sudo mkdir -p /opt/byteforge/shared

# Настраиваем каталог технической поддержки
sudo chown olga:support /opt/byteforge/support
sudo chmod 770 /opt/byteforge/support

# Настраиваем каталог аналитического отдела
sudo chown marina:analytics /opt/byteforge/analytics
sudo chmod 770 /opt/byteforge/analytics

# Настраиваем общий каталог с полным доступом для всех
sudo chmod 777 /opt/byteforge/shared

# Проверяем владельцев, группы и права каталогов
ls -ld /opt/byteforge/support
ls -ld /opt/byteforge/analytics
ls -ld /opt/byteforge/shared


# ==========================================
# Часть 3. Общая временная папка
# ==========================================

# Создаём каталог для временных файлов
sudo mkdir -p /opt/byteforge/shared/tmp

# Устанавливаем Sticky Bit и права 777
# Пользователи могут создавать файлы,
# но не могут удалять чужие файлы
sudo chmod 1777 /opt/byteforge/shared/tmp

# Проверяем установку Sticky Bit
ls -ld /opt/byteforge/shared/tmp


# ==========================================
# Часть 4. Скрипт технической проверки
# ==========================================

# Создаём файл скрипта
sudo touch /home/olga/health_check.sh

# Добавляем право на выполнение всем пользователям
sudo chmod a+x /home/olga/health_check.sh

# Проверяем права файла
ls -l /home/olga/health_check.sh


# ==========================================
# Часть 5. Настройка маски umask
# ==========================================

# Устанавливаем маску:
# файлы будут создаваться с правами 644,
# каталоги — с правами 755
umask 022

# Создаём тестовый файл
touch /home/olga/mask_test.txt

# Создаём тестовый каталог
mkdir -p /home/olga/mask_test_dir

# Проверяем установленные права
umask
ls -l /home/olga/mask_test.txt
ls -ld /home/olga/mask_test_dir


# ==========================================
# Итоговая проверка
# ==========================================

# Проверяем права технических файлов
ls -l /home/olga/release_report.txt
ls -l /home/olga/health_check.sh

# Проверяем рабочие каталоги
ls -ld /opt/byteforge/support
ls -ld /opt/byteforge/analytics
ls -ld /opt/byteforge/shared
ls -ld /opt/byteforge/shared/tmp

# Проверяем тестовые объекты
ls -l /home/olga/mask_test.txt
ls -ld /home/olga/mask_test_dir

# Выводим текущую маску
umask

echo "Лабораторная работа №2 завершена."