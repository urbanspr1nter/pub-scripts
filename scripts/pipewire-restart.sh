#!/bin/bash

systemctl --user restart pipewire.service
systemctl --user restart pipewire-pulse.service
systemctl --user status pipewire.service
systemctl --user status pipewire-pulse.service
