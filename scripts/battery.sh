#!/bin/bash
echo "$(acpi -b | cut -d' ' -f3 | rev | cut -c 2- | rev ) $(acpi -b | cut -d' ' -f4 | rev | cut -c 2- | rev ) $(acpi -b | cut -d' ' -f5)"
