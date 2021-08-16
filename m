Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.21781.1629105989885508233
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Aug 2021 02:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:35874 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mFYt2-0007sR-AX
	for docs@lists.yoctoproject.org; Mon, 16 Aug 2021 05:26:29 -0400
Date: Mon, 16 Aug 2021 05:26:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: update output of "wic list images"
Message-ID: <d8bbda85-5b41-c51-c5da-c82defe4ec45@crashcourse.ca>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


Output order from "wic list images" is in different order, and was
missing a couple entries.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 7f51674a9..72202f74d 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -5197,17 +5197,19 @@ command to return the available Wic images as follows::

    $ wic list images
      genericx86                    		Create an EFI disk image for genericx86*
-     beaglebone-yocto              		Create SD card image for Beaglebone
      edgerouter                    		Create SD card image for Edgerouter
-     qemux86-directdisk            		Create a QEMU machine 'pcbios' direct disk image
-     directdisk-gpt                		Create a 'pcbios' direct disk image
-     mkefidisk                     		Create an EFI disk image
-     directdisk                    		Create a 'pcbios' direct disk image
+     beaglebone-yocto              		Create SD card image for Beaglebone
+     qemux86-directdisk            		Create a qemu machine 'pcbios' direct disk image
      systemd-bootdisk              		Create an EFI disk image with systemd-boot
      mkhybridiso                   		Create a hybrid ISO image
+     mkefidisk                     		Create an EFI disk image
      sdimage-bootpart              		Create SD card image with a boot partition
      directdisk-multi-rootfs       		Create multi rootfs image using rootfs plugin
+     directdisk                    		Create a 'pcbios' direct disk image
      directdisk-bootloader-config  		Create a 'pcbios' direct disk image with custom bootloader config
+     qemuriscv                     		Create qcow2 image for RISC-V QEMU machines
+     directdisk-gpt                		Create a 'pcbios' direct disk image
+     efi-bootdisk

 Once you know the list of available
 Wic images, you can use ``help`` with the command to get help on a

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
