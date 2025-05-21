# LockCrypt.LockScreen

## Description

**LockCrypt.LockScreen** est un bootloader x86 développé pour démontrer la faisabilité, en rétro-ingénierie et en cybersécurité. Il simule un écran de type ransomware au démarrage d'un PC, des interruptions, et de la structure d'un secteur d'amorçage.

> ⚠️ **Projet à but éducatif uniquement.** N'utilisez jamais ce code dans un environnement non contrôlé ou à des fins malveillantes.

---

## Contenu du projet

* `bootloader.asm` : Code source en assembleur x86.
* `bootloader.bin` : Binaire généré (secteur de boot de 512 octets).

---

## Compilation

Prérequis : NASM doit être installé sur votre machine.

```powershell
& "C:\Program Files\NASM\nasm.exe" --% -f bin bootloader.asm -o bootloader.bin
```

Cette commande compile le code source en un fichier binaire de 512 octets utilisable comme bootloader.

---

## Test avec QEMU

QEMU permet de lancer le bootloader en machine virtuelle.

```powershell
& "C:\Program Files\qemu\qemu-system-x86_64.exe" bootloader.bin
```

Cela exécutera le bootloader dans un environnement sûr et contrôlé.

---

## Fonctionnement technique

* Chargement à l'adresse `0x7C00` par le BIOS.
* Affichage d'un message via `INT 10h` (mode texte BIOS).
* Boucle infinie d'attente via `hlt`.

---

## Aperçu du message affiché

```
################################
#                              #
#     your PC has been encrypted   #
#                              #
#    NO FILES ARE ACCESSIBLE       #
#   Please contact me              #
#      i am kevin                  #
#                              #
################################
```

---

## Limitations

* Le fichier binaire ne doit pas dépasser **512 octets**.
* Pas d'interaction utilisateur.
* Aucun système de déverrouillage.

---

## Licence

Usage strictement éducatif. Toute utilisation malveillante est interdite.

---

## Auteur

Développé par un passionné de cybersécurité et de programmation bas niveau.
