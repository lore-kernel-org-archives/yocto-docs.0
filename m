Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13597.1795091225579233668
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Nov 2026 04:27:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ORloeYik;
 spf=pass (domain: gmail.com, ip: 209.85.221.170, mailfrom: otavio.salvador@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so703017e0c.0
        for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2026 04:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795091224; x=1795696024; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iC7pzttz+FM9ra3TTcezWwURd3ZWRvxWmDqOkquWH7s=;
        b=ORloeYikE2Cngb7/BYD5NCfeCYC5M0ib34nfQPqB9ZEXhm4J81fDGjrOrRmjkTGvyX
         yLHVZkFSTDG6OIDHT6ktNbz3yhvxKQCNhQm2kotAmOe5Lll2guw0VWPFTcgkL6GgJxGX
         MuCm0yPrStgzPFJeUj/c1DVB1ePQIrh9mXdwwxI/iYomRUU9OjMjU2/3R0YP1QJigk8s
         HypOCjG1xLg6rvqAmZF46czK/8aq85KMTvFEqQJ3X1UU934y5TItfWv3JEx4HoB9TcOa
         Q/HmBMWReErPgQakOKwupzFt+S7/UoP/+z44wL1kkT9Y/lxi0wpnG0mSftqDO6LCYmZv
         vd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091224; x=1795696024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iC7pzttz+FM9ra3TTcezWwURd3ZWRvxWmDqOkquWH7s=;
        b=lRj8kORznLKb2q5pO8yaLTvGSTVjn9RmeVuGzVhjQFlALKaHPuZkRw55NhPvbH1X+9
         c6d+dYsi8tZTtNH6Wf13A4UQmL0ZOuQMCJxf7o9ILWEVbqEvknGPjyWTxgDy4ITW+kQx
         bgKIbx7HRM7a+mpju21hiQ2o04YrbASa4tX1iVfZWc2QXjrtbcMx6A0oJilagCXK6SKd
         tFE8fCy/LEyr+qQ1r4XXH8zfbuwhKxV/IAdJci1Mih8FlV0ZJ6UVU4tqge1YN/9tdhFW
         VIfG1WsoeUodZhh/iH9oLX0+ixitCgGaUtrPIv3yK01vB+FHXLjM1ByyGrfyjrdm88Xh
         +GEA==
X-Gm-Message-State: APuU4Z8CfAXSPYgo7IMrj88UPUzSIlbdrdyyTjzD5uPP7IyUq1rxkABx
	Kxo3YDYWw0adQMNaWzPfs+1r1Mn1oN5FpUBlHP/mzBBZaKXwP9ky8P2m7rjBBNlR
X-Gm-Gg: AYBFou0TSrpE+s8IHl/YNfxNuPSZLu9opG528iYETyoJ7CQeZ6VR7LhcguCbl8b1zS5
	/UfjaPGR5ifMGkD3QAl6xrVi86aiWBNh4JFMMX1zJKkZ+0LvBZsAD18AmbzpdoJsQRO61bRplZc
	7DJtYHBEynLnAS6N9ybU8riwP1tfSQiajGYhfWiAs+ElGAtEA9YLQXchDd1BQQww/RfCpUfahR+
	i7+q0JPVPzdy48Hj+FBoJ7kAlLNyyp999MNLKT5uefUWsQludLfsCKf5oMzd522duDQ43Sif9oE
	A4n47ZT/PbYzDdKSGG/bZ6tMtG2veUUyPZwymMkzdGuHMX0N/LZmQW58uK3Y1U29zy2quX0F+ti
	x9OMve3mgDH7BVPKloskMOibVh9IcL4mtYzZCWRtK88XV++QzRr96tt3slmkB4qUdh8KT5fzpw8
	V1PCOOcju8Ko7NrFNQ3YEw/tyeSRlUkSbrbolRESXvgrUJkPytCrV+73R9fUEW5aIeYOVT8Ptkw
	lPKq0n1u93Xzznp1rTWqGsoj/wPVKjETEBrmhNkP9Y1OOYpiACBWo3O1vuNK0kpNJFjzCt8gHbZ
	pgAcUdgHU482iIydMpdyY2rAaaVBjCt1BGjKaWa4CKHxdt/0DBjXF0fXFFGnrWct0xinM1ItQbr
	eD4tFunq1t4EYl705d1zhSgF4zChtcZ2Y0E0kidzR8uFw3cVjIwB/B1/jgKFdJK9VuK3Mp9aZPS
	z0Sn4Bx+pmH6BplmoFRXYLW5NyxWM=
X-Received: by 2002:ac5:cac1:0:b0:5ec:d7f3:4f3c with SMTP id 71dfb90a1353d-5ee82731bc3mr179072e0c.12.1795091224421;
        Thu, 19 Nov 2026 04:27:04 -0800 (PST)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([201.89.183.192])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee64ec2730sm4029101e0c.14.2026.11.19.04.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:27:03 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio.salvador@ossystems.tech>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.tech>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [PATCH yocto-docs v2] dev-manual: Document yocto-check-layer --run-tests
Date: Thu, 19 Nov 2026 09:27:00 -0300
Message-ID: <20261119122700.1695957-1-otavio@ossystems.tech>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118231326.3121089-1-otavio@ossystems.com.br>
References: <20261118231326.3121089-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2026 12:27:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10799
Content-Type: text/plain; charset="utf-8"

yocto-check-layer can now run a subset of its tests with --run-tests,
for example to split a long check of a BSP layer over several runs.
Document the option, and that a PASS from such a run doesn't make a
layer Yocto Project Compatible: that needs a single run with all the
tests and, for a BSP layer, all its machines.

AI-Generated: Claude Code, Opus 5.5
Signed-off-by: Otavio Salvador <otavio@ossystems.tech>
---
Changes in v2:
- Use the same address for the author and the Signed-off-by.

 documentation/dev-manual/layers.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 5c8bf32b4..5a6577fd1 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -405,6 +405,19 @@ argument should be passed as part of the command::
 These machines are the ones present in your BSP layer, in the ``conf/machine/``
 directory.
 
+To run only some of the tests, for example to split a long check over
+several runs, pass their names to the ``--run-tests`` argument, as
+``<module>[.<class>[.<name>]]``::
+
+   $ source oe-init-build-env
+   $ yocto-check-layer --run-tests bsp --machines <machine1> <machine2> ... -- your_layer_directory
+
+.. note::
+
+   A "PASS" from such a run only covers the tests and machines it ran. A
+   layer is Yocto Project Compatible only if a single run with all the
+   tests, and with all the machines of a BSP layer, passes.
+
 Entering the command causes the script to determine the type of layer
 and then to execute a set of specific tests against the layer.
 
-- 
2.54.0

