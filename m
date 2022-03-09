Return-Path: <svet.am@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F20C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 02:42:28 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.1549.1646793747200464414
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 18:42:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MrmNLIoe;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: svet.am@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-2dc585dbb02so8040277b3.13
        for <docs@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 18:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=5008IMGONB9AVk7/g7yfpn4uugpnWiFLdz+DpN7SIbc=;
        b=MrmNLIoem9a41phZmKq88iLUu57wzZFKke3U4A9lP+zUElFAlw5whbUxU4KhBr0pX+
         ONjVNouo9upITPql5YsR9rygcb+AIMg2eNx4QjgS+MabX2j4H0bvVaF3OjEFcFzDs2Tk
         nD+OsB9NmiDFPH97byWH+0Er1oDWaAv7pV5m2Ti2UN2EttVpxM+HZ8apfyXAYQmqd/DJ
         If4EUB3MLpecoTOltVlDjZ8yEZp+tXAUhKibnUIs61dNlHg9skMHjMNt8sIbwMXPuZgi
         x4ilaUyhUJLrCEpAMgrVLX/xocXXzVII0Mtl3iR9T7R8vQOIH95W4oeLPA7t8YqNoNA1
         O7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=5008IMGONB9AVk7/g7yfpn4uugpnWiFLdz+DpN7SIbc=;
        b=h7+oeMTlrmBDgrBn/HkLxwZ60MjnRtT+2bz8dNd2Iios16V0dO1VeUmg0wWTvMkPvo
         7pkvwHDY6/Fb3S+5QvqNCQ6dKQS9AZBDlgJLx5IK0aXuyW1XNK8LvUxCst6I76HyvtA7
         bUJqAJsdVXDKuni/PpwKbO3RA62ahwfhpC95m0hodf0LCHtWdrCwZ9RPFy3ljEBF26bV
         Gzwu48JbdPNaC9h3wVZPQ1hNFt9DOcemledrmmRyicQCLwH88KY3iUTf1JJ2HUCqsqMf
         wwOeJ/yWBwtQ79N0+qp269eyTb+/81sV9zDATcrF8G2wQnBeW+aY5GLoAZZX/lR/K9K2
         S1eA==
X-Gm-Message-State: AOAM531WZ8nO8E+tye86n8F9CgFGxiN990Ep040lZYVY1YXsO5nvuUVV
	lOVVwDPCdY64MRfnItz4NoKntxCQmtFray+QKpgpR+9vBRgb0w==
X-Google-Smtp-Source: 
 ABdhPJxNEicFTN6vMi0tJ9UXkgwoEmDbvVxf3u3eLapi6+dlLEylK25c6mgrgeh8inj3CReW5jJ2zCN9TzcBr2tfbb0=
X-Received: by 2002:a81:8d1:0:b0:2d0:ebfe:210d with SMTP id
 200-20020a8108d1000000b002d0ebfe210dmr15321631ywi.486.1646793746085; Tue, 08
 Mar 2022 18:42:26 -0800 (PST)
MIME-Version: 1.0
From: Tony McDowell <svet.am@gmail.com>
Date: Tue, 8 Mar 2022 19:42:15 -0700
Message-ID: 
 <CADmuqUfgVBj28RbjVwGGxcT2NnP2k=DxSZ8z6C=miBqtncoN4w@mail.gmail.com>
Subject: [PATCH] dev-manual: add instructions for compacting WSLv2 VHDX files
 using DiskPart for those systems which lack optimize-vhd
To: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Mar 2022 02:42:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2553

This is an alternative way to compact VHDX files for Yocto Project use
since the prior instructions depended on a Windows tool not available
on all Windows hosts.

---
 documentation/dev-manual/start.rst | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/start.rst
b/documentation/dev-manual/start.rst
index 9c7dde8cf..80288b607 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -523,8 +523,7 @@ your Yocto Project build host:
       Your VHDX file path is:
       ``C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\ext4.vhdx``

-   2. *Optimize your VHDX file:* Open a Windows Powershell as
-      Administrator to optimize your VHDX file, shutting down WSL first::
+   2a. *Optimize your VHDX file using Windows Powershell:* To use the
optimize-vhd cmdlet below, first install the Hyper-V option on
Windows.  Then, open a Windows Powershell as Administrator to optimize
your VHDX file, shutting down WSL first::

          C:\WINDOWS\system32> wsl --shutdown
          C:\WINDOWS\system32> optimize-vhd -Path
C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\ext4.vhdx
-Mode full
@@ -533,6 +532,16 @@ your Yocto Project build host:
       VHDX file, and storage should now be reflected correctly on the
       Windows Explorer.

+   2b. *Optimize your VHDX file using DiskPart:* The optimize-vhd
cmdlet noted in step 2a above is provided by Hyper-V.  Not all SKUs of
Windows can install Hyper-V.  As an alternative, use the DiskPart
tool.  To start, open a Windows command prompt as Administrator to
optimize your VHDX file, shutting down WSL first::
+
+         C:\WINDOWS\system32> wsl --shutdown
+         C:\WINDOWS\system32> diskpart
+
+         DISKPART> select vdisk file="<path_to_VHDX_file>"
+         DISKPART> attach vdisk readonly
+         DISKPART> compact vdisk
+         DISKPART> exit
+
 .. note::

    The current implementation of WSLv2 does not have out-of-the-box
-- 
2.31.1.windows.1

