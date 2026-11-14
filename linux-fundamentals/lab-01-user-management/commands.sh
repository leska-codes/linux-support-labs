#!/bin/bash

# Лабораторная работа №1: Управление пользователями и группами
# Внимание: Выполнено в тестовой среде

# ==========================================
# ЧАСТЬ 1. Подготовка инфраструктуры
# ==========================================
echo "--- Часть 1: Создание групп ---"
sudo groupadd backend
sudo groupadd frontend
sudo groupadd infra
sudo groupadd analytics

# ==========================================
# ЧАСТЬ 2. Приём сотрудников
# ==========================================
echo "--- Часть 2: Создание пользователей ---"
# Алексей
sudo useradd -m -g backend -c "Алексей Морозов" alex_m
# Марина
sudo useradd -m -g frontend -c "Марина Волкова" marina_v
# Денис
sudo useradd -m -g infra -G backend -c "Денис Орлов" denis_ops
# Екатерина
sudo useradd -m -g analytics -c "Екатерина Соколова" katya_data

# Безопасная настройка sudo для Дениса
echo "denis_ops ALL=(ALL:ALL) ALL" | sudo tee /etc/sudoers.d/denis_ops
sudo chmod 0440 /etc/sudoers.d/denis_ops
sudo visudo -c

# ==========================================
# ЧАСТЬ 4. Инцидент безопасности (Гриша)
# ==========================================
echo "--- Часть 4: Инцидент с grisha_root ---"
# Создаем бывшего админа и даем ему права
sudo useradd -m -c "Григорий Чёрнов" grisha_root
echo "grisha_root ALL=(ALL:ALL) ALL" | sudo tee /etc/sudoers.d/grisha_root
sudo chmod 0440 /etc/sudoers.d/grisha_root
sudo visudo -c

# Блокируем его
sudo usermod -L grisha_root

# ==========================================
# ЧАСТЬ 5. Изменение должностных обязанностей
# ==========================================
echo "--- Часть 5: Перевод Марины ---"
sudo usermod -g backend marina_v

# ==========================================
# ЧАСТЬ 6. Ликвидация отдела
# ==========================================
echo "--- Часть 6: Удаление frontend ---"
sudo groupdel frontend

# ==========================================
# ЧАСТЬ 7. Финальный аудит
# ==========================================
echo "--- Часть 7: Аудит ---"
getent group backend infra analytics
getent group frontend
id alex_m
id marina_v
id denis_ops
id katya_data
sudo passwd -S grisha_root
sudo -l -U denis_ops

echo "Скрипт завершен."