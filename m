Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.217])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12169.1794070907045017176
 for <docs@lists.yoctoproject.org>;
 Sat, 07 Nov 2026 09:01:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@awto.se header.s=strato-dkim-0002 header.b=YZsVsSXp;
 dkim=pass header.i=@awto.se header.s=strato-dkim-0003 header.b=K1znwbU0;
 spf=pass (domain: awto.se, ip: 81.169.146.217, mailfrom: erik@awto.se)
ARC-Seal: i=1; a=rsa-sha256; t=1794070904; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=qszx8jCE54KCqVp9MQHYiDAO+ksrf1H+wKHuyJFZGxX4i5d3+eFm0g5BkCujwHqa0f
    adQ/Y3S8IX8+8BrfXq0ZSxELKb7vwY1/8+m0qdchBi69FkbRAEY4JSmaM9VEUUzO+s8X
    QALaY6eymZEv72++uB3jXEaYiWDpq2MOx/U5+2j47m0J2Rlx8/KlCjbdlC1lpGqH/bkj
    v+TFxiiDbzM7PdFpupKjoVlLggSzfm5Y9slw3b23YVhokAC/dLJDJVJ21K3qSDU6nuz7
    yVpAptBv76aes01ekhN2jBkQedd+hHBT4hmX6qgW2CpW9NsFG4EgXu1iQlKjbi/mnA3I
    /ZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794070904;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=qODVaqNnLN6F7DkodJYzwSf2jaW2fCz8HQzPFK1a0+M=;
    b=divokAsi4GvrWGK86VnkrVgmnsQvhhwwabndE32u9gfik1wQXVfiC+tUURb9BTYwjx
    phQ2mS11JTpYDFisg+LNIOxqiIwIN/Z6QIcRYKoF5pNj6FHlOyvNOQS6YzBy+nr52u6X
    qCnZLZ3dMhyyCHSZff119rEYoTMzuhVimY+CXpQFt/0oQ46al2ZuzssR5fc5dvKa4C8E
    ev6ZEgCrNGaA8zlV8XACpKWIhdvWi51QUoWUVPaNd+9kTc3kw1BLOjx2DjrgXG/n1XqL
    ed9E0W1Fh+0rBE7h+2vATFGqRKL8W+2meKhYxbuCBjBJJyNoxZXpXTO605oZLFvZOCCL
    ZeyQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794070904;
    s=strato-dkim-0002; d=awto.se;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=qODVaqNnLN6F7DkodJYzwSf2jaW2fCz8HQzPFK1a0+M=;
    b=YZsVsSXpigSvd8cYoRtZXmbxLvHiTPSTHZuAFvnkJMdOtcaJUZReZt8FMRsj7kXXLL
    4YvzVEiLNerdz+eqqOPL2RPSmfBp02dQ1x5eLFesuXnVvQ6qN+LDo1uTJ82eYNMSPPv6
    JYgVKyMWCwRIlMR3VKevUHjyeMaUpyK1jS5y4pkxMCvRcbaBYtnSc4YDKj+t6j0sEVrL
    JvE0xzINjvIKbKpjJuTMZFKlbTSDthipn7IgLAPg6cI2XP6kjoMzSgsHs4iE2EAYOHLM
    niRzHze4R5dnbnpFVKrCxDrJ3/zusHIb3yfr5UQeCWdruH3nzZXMXtQ2UssEvahkqijg
    1oDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794070904;
    s=strato-dkim-0003; d=awto.se;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=qODVaqNnLN6F7DkodJYzwSf2jaW2fCz8HQzPFK1a0+M=;
    b=K1znwbU0hGAsU/0nIEEnHSg1Sa2rxxB8NU6LrKey50q2YKEkW+nuLYdTCqHBD54XB7
    QrBVmldfhJR3cB4o/dCg==
X-RZG-AUTH: ":KX4NfmCpbOtr2h56gDJdGbPh106htHVWsoECWG/Ym0sGLwlH95NuGYZh"
Received: from erik-desktop.tailfdfae0.ts.net
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qa186c2A7H1iIVh
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 7 Nov 2026 18:01:44 +0100 (CET)
From: Erik Lindsten <erik@awto.se>
To: docs@lists.yoctoproject.org
Cc: Erik Lindsten <erik@awto.se>
Subject: [PATCH 1/2] kernel-dev/maint-appx.rst: fix the kernel cache repository name
Date: Sat,  7 Nov 2026 18:01:34 +0100
Message-ID: <20261107170135.84816-1-erik@awto.se>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Sat, 07 Nov 2026 17:01:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10777

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

