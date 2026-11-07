Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12178.1794071096772182516
 for <docs@lists.yoctoproject.org>;
 Sat, 07 Nov 2026 09:04:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@awto.se header.s=strato-dkim-0002 header.b=QymdNjnh;
 dkim=pass header.i=@awto.se header.s=strato-dkim-0003 header.b=EgYfTOSv;
 spf=pass (domain: awto.se, ip: 85.215.255.21, mailfrom: erik@awto.se)
ARC-Seal: i=1; a=rsa-sha256; t=1794071094; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=s7qwXme6gN3ML6rcC8ukOfy9q4wlgSoiSgd+V0DDgeeE3RBGoQE8xo5785/R67n3eO
    8bqPOu/BtAcUTejC2TLey2al1RDKTtYh4JZrmYL0vakSI6fvUqrmC6RRcrfeCfZkVtB4
    tfjgTKzNbKdNgY5Ip/GGGOWhxxkGmNBF+aA+18UMmZbFWIjXzCfTTQsFwyTewXIX3jWD
    LFhXPdhY1m7trk0Vex9jTfh+jsrxT2LbMY+OSk8AlFGZeeQHS8EOFiEC8Ndayq34suST
    m+vdrRbFFyvBRCd8WVmR1VZ585EzkYdgSVW/DL1GzIIHEXKTaC1W9U16a657IREzXkap
    ndjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794071094;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=qODVaqNnLN6F7DkodJYzwSf2jaW2fCz8HQzPFK1a0+M=;
    b=kDjQWl94x0bVaJqm8bcNRzvnIZz0PgYRmSIn3wCOzDCeb5rCgHIQR4xelAD0cp1xsv
    uk3CYLigx29NmLevkOCDupFSDaS6rsqswF/IBIlJ9DYMrILDQwkCsGlcnSxmnj7qwoiC
    IY3wRL+Aq3K8F9tNalG5Nb36EnP0geuy7MwbNT5aYrS03K6L4zpx5BXQ1jdfp8MEVZgT
    uthPSmQSKfiJ1jXtjI9MwrltB2LiEcgJcYtvlkdykL4pTx7ovYTa+geZlT5UWyuwgVZS
    8TDF6OFk3KeljZm/rrw0VNloTxl2GbB3TIByhqlWN1u+G8gRenuGm0TOCERWGJbUxWHN
    MM6w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794071094;
    s=strato-dkim-0002; d=awto.se;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=qODVaqNnLN6F7DkodJYzwSf2jaW2fCz8HQzPFK1a0+M=;
    b=QymdNjnhrYxX4XysokcZZypFR/zyNCvYxkYGO0jDPAmCDU1CyoUhHjd35NjLFJ9vFF
    ftx5vomgmPAkC7et4YWFfWaFgvQLNq4lS9cRlB358EDtAI3VmR9tZG0pb78IRnigpJTQ
    Z9DHElWKz5bd8KMfMNpvXro8s56+Wkd+UZnrJtRzX3pJlx7hFXsyfHk8q2OwS4NIuaTm
    CPvtojVTh74ol91K8tKU2f1X+FWmS7y1ga79XEslg5xSP2cfmSr/oGUiWTisgtRBM1Gi
    SaPdA78MIe0VF4VL2mO5VWEZXreIa5KHY79Y3rWn9V1DJerxhemCWI4F4hoXeU3fvNk9
    UNkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794071094;
    s=strato-dkim-0003; d=awto.se;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=qODVaqNnLN6F7DkodJYzwSf2jaW2fCz8HQzPFK1a0+M=;
    b=EgYfTOSvsvG45s8AHzsqL/1akyjsZD+ew7NOFDQQ57MfVs07q3GsACD2KhOMxIqTEx
    N4QFugiIRtld/+/QvvBg==
X-RZG-AUTH: ":KX4NfmCpbOtr2h56gDJdGbPh106htHVWsoECWG/Ym0sGLwlH95NuGYZh"
Received: from erik-desktop.tailfdfae0.ts.net
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qa186c2A7H4rIWR
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 7 Nov 2026 18:04:53 +0100 (CET)
From: Erik Lindsten <erik@awto.se>
To: docs@lists.yoctoproject.org
Cc: Erik Lindsten <erik@awto.se>
Subject: [PATCH] kernel-dev/maint-appx.rst: fix the kernel cache repository name
Date: Sat,  7 Nov 2026 18:04:36 +0100
Message-ID: <20261107170437.86075-1-erik@awto.se>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Sat, 07 Nov 2026 17:04:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10779

Signed-off-by: Erik Lindsten <erik@awto.se>
---
 documentation/kernel-dev/maint-appx.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/kernel-dev/maint-appx.rst b/documentation/kernel-dev/maint-appx.rst
index 48deec4..36ce77e 100644
--- a/documentation/kernel-dev/maint-appx.rst
+++ b/documentation/kernel-dev/maint-appx.rst
@@ -31,7 +31,7 @@ kernel that branches off ``linux.org`` version 4.12 and the
 ``yocto-kernel-cache``, which contains stores of kernel Metadata::
 
    $ git clone https://git.yoctoproject.org/linux-yocto-4.12
-   $ git clone https://git.yoctoproject.org/linux-kernel-cache
+   $ git clone https://git.yoctoproject.org/yocto-kernel-cache
 
 For more information on
 how to set up a local Git repository of the Yocto Project Linux kernel
@@ -52,7 +52,7 @@ the "yocto-4.12" branch of the ``yocto-kernel-cache`` repository::
 
    $ cd ~/linux-yocto-4.12
    $ git checkout -b my-kernel-4.12 remotes/origin/standard/beagleboard
-   $ cd ~/linux-kernel-cache
+   $ cd ~/yocto-kernel-cache
    $ git checkout -b my-4.12-metadata remotes/origin/yocto-4.12
 
 .. note::
-- 
2.53.0

