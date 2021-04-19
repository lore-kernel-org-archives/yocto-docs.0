Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.6860.1618827085347969008
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 03:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GV4Bi96L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id j5so32407378wrn.4
        for <docs@lists.yoctoproject.org>; Mon, 19 Apr 2021 03:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:references:user-agent
         :mime-version;
        bh=4XAjQoyoOTbe5AV4Zn4YoyO9pz6ttCKalhS1ZDpIc1M=;
        b=GV4Bi96LJdK0/nsV33bxSrhCjfIkOWlOf7QTn7ns22Vw1WAByVT2djiijdbtDtXNDn
         DQLcXCIWAd0yCikwgqkoRj3gB/RNCjGRWiMRsNE8iPl6vCb44+tRQPPXKO9S18AQ6e+8
         bDVqqbDt12gh8BSXcuZrHSmKlWHq5wmhg6JxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:references
         :user-agent:mime-version;
        bh=4XAjQoyoOTbe5AV4Zn4YoyO9pz6ttCKalhS1ZDpIc1M=;
        b=SueHlniIQY9og9pTnKO7gA+YsUMPbh+CR6Ui5ozHLKIXD/x4ewTmf1aofI0sEY6qWV
         HfXEYqoqQHhQcBoRg0AxYy7idR6u66grsSGiKmDswV+7m9+sSkVamICd9q0kpK+X01MI
         ltdgtZgTJMEnYEey15baY+7m/6ChG47pzybNllwaD4Ciu3mx45DdSlMIjTSeGxpzZLo7
         4uopbou6LJ4441Bdgx8TQbro9iRoIPjpq6KHEPb8Pdu6PUCp+C2ByZcqhv8RBch0PBmK
         k5ISSf2ooCi4Ff0G6vycDgOA3baefcsW/vzrV3uB2OtXedT58q1vceqCkOGHl7HIzxtv
         npuA==
X-Gm-Message-State: AOAM533dqCO9+ShR+NKkCT2rIuhZUtYJV9V5yknx4oV9TGmE9iwK6Dn0
	ndfvRFJLXUtbe1KbQx8fIV0MU79kZFKgqg==
X-Google-Smtp-Source: ABdhPJzIXhFAiph7VA3sFj44jqnjf4bDF44gAONejeJvM55uTe7U2wEXvdRLMt4df5jCXfoNvClOZg==
X-Received: by 2002:a05:6000:12c5:: with SMTP id l5mr13367373wrx.84.1618827083901;
        Mon, 19 Apr 2021 03:11:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:3b9d:2a57:e60:cfc4? ([2001:8b0:aba:5f3c:3b9d:2a57:e60:cfc4])
        by smtp.gmail.com with ESMTPSA id x9sm10227757wrt.13.2021.04.19.03.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 03:11:23 -0700 (PDT)
Message-ID: <8b2212544d8f565c7343a88d837c8c6f390e82e8.camel@linuxfoundation.org>
Subject: [OE-core] [PATCH 4/4] dev-manual/common-tasks.rst: correct the documentation for debuginfod
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs <docs@lists.yoctoproject.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Apr 2021 11:11:21 +0100
References: <20210419090044.582453-4-alex.kanavin@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
X-Groupsio-MsgNum: 1126
Content-Type: multipart/mixed; boundary="=-zaDCNz6Ik5nh7AXNoOTJ"

--=-zaDCNz6Ik5nh7AXNoOTJ
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Forwarded from OE-Core to ensure docs people see it.

Cheers,

Richard

--=-zaDCNz6Ik5nh7AXNoOTJ
Content-Disposition: inline
Content-Description: Forwarded message =?UTF-8?Q?=E2=80=94?= [OE-core]
 [PATCH 4/4] dev-manual/common-tasks.rst: correct the documentation for
 debuginfod
Content-Type: message/rfc822

Return-Path: <richard.purdie+caf_=rpurdie=rpsys.net@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on dan.rpsys.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0
 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
 DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NUMERIC_HTTP_ADDR,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,WEIRD_PORT
 autolearn=ham autolearn_force=no version=3.4.4
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46]) by dan.rpsys.net (8.15.2/8.15.2/Debian-18) with ESMTPS id
 13J9443T1633862 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128
 verify=NOT) for <rpurdie@rpsys.net>; Mon, 19 Apr 2021 10:04:05 +0100
Authentication-Results: dan.rpsys.net; dkim=pass (1024-bit key;
 unprotected) header.d=lists.openembedded.org
 header.i=@lists.openembedded.org header.a=rsa-sha256 header.s=20140610
 header.b=ojHrqixF; dkim-atps=neutral
Received: by mail-wr1-f46.google.com with SMTP id c15so24190688wro.13
        for <rpurdie@rpsys.net>; Mon, 19 Apr 2021 02:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1e100.net;
 s=20161025;
 h=x-gm-message-state:delivered-to:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:precedence:list-unsubscribe
 :list-subscribe:list-help:sender:list-id:mailing-list:delivered-to
 :list-post:dkim-signature; bh=GVdCDAAEC7n1gnjsqDwVk2No3AG15o0VrvDa0BBzgPI=;
 b=KRDjGsZFZ/TYYz60seHkcLxUGQ6+4UfP0raenBeqH2R4UIDNLP5T43YlkKLMVGiD1a
 Iyg/sHMfXgduZY3W9ZPJOxzlf11/KUt5mizoc4vuK+4IWBZIqPSrjG3mx0vF+huGD/Qk
 GKAoFw/FSggdIRPkxr9Un51lpftDAbJQU7JD8Qau//J5CjzPPP5eCDT5DATMeSgr/LKi
 M7kvN6QpLjNoR7QkGl9Pbpw6XZpFXy0k/MXk2juUAFzch1NJO89ohl54ln6/GHje/oRm
 pxr+otcVjy8EWKefXht7lzKlLjnkggq+JBMTtsCY3Trh8W8JFsuS7QWduBm+cofLHKQ9 TEEA==
X-Gm-Message-State:
 AOAM533ncYiJ0eSEA5+M+rcgajfuL6dCrkmsIQUteGcbuedkr6d8pYCs
 XDUEgXmc8939dMuSlGbMiMFYGTDxnJrAWJ2hA0ltmfdoYZr5qGVj6GOq
X-Received: by 2002:a5d:4d0b:: with SMTP id
 z11mr13672912wrt.164.1618823039038; Mon, 19 Apr 2021 02:03:59 -0700 (PDT)
X-Forwarded-To: rpurdie@rpsys.net
X-Forwarded-For: richard.purdie@linuxfoundation.org rpurdie@rpsys.net
Delivered-To: richard.purdie@linuxfoundation.org
Received: by 2002:a5d:44c7:0:0:0:0:0 with SMTP id z7csp2665076wrr;
        Mon, 19 Apr 2021 02:03:57 -0700 (PDT)
X-Google-Smtp-Source:
 ABdhPJx4IOIvMbG9DEaBg2J0Vc+ALYkxiAEwEKpoUPX811LwpL7vLuy/5oHncywC4onZz4KEcyyU
X-Received: by 2002:a1f:1c09:: with SMTP id
 c9mr13957607vkc.16.1618823036883; Mon, 19 Apr 2021 02:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618823036; cv=none; d=google.com;
 s=arc-20160816;
 b=T3PV0Kp5UvlQY+NAD62PYWikEn6i2YrHq9BKGj3nmCy806WiFsKdPKt6ATay88a7L0
 BtCWfD0SWo1c4BnN1rCDOClHwtAVjgZaKkWdMYJp5wtyc/9XLmtuo/ocPQSYIGBhAw4L
 IwyUIxrNOl3m96zH9EmAAnt20ag1lNR5rN7EHM6qkJV/mwqexwYI/+NwFWl8IcWHGC1h
 j39T+GrEI0cFWhVJCH3AyHgxsFL2dE+RQ8wTmWlSmNWgRmGBSFuS2QdFxcN8cTcbO++k
 ac6P1gSaOOn+98F0CPNQjdAUc0dGlRgKv/oTsySN/ksGuX3stet73odPOwhjI2hayBE1 7eSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816;
 h=dkim-signature:list-post:delivered-to:mailing-list:list-id:sender
 :list-help:list-subscribe:list-unsubscribe:precedence:mime-version
 :references:in-reply-to:message-id:date:subject:cc:to:from;
 bh=GVdCDAAEC7n1gnjsqDwVk2No3AG15o0VrvDa0BBzgPI=;
 b=AVlTWRQQTeEJQePTEL0VaGnQTAFzW/+Gz9kZyFhC6m6tT3ftA1QmMg+IT8compW/GX
 9P/KtUwlbylQ5QpwSXYRCUUPgw2ImXVJkZUwHl8uCtvYAcGA26p1Jzvo5MAvQ6bJ7AtP
 LO9NT3PFTgVNvpOLexIVaLa4JisiQZIjQnx53d5U5HrarUzd1EZIacueiyFYZIz9u3MZ
 BHGOtnUMV6OCrCAgIFr+U0FWBbKUrEA/4SrJ29Xq8rUDrJaWuiX+PHzGoCDDegR6ykuP
 x+DVbdKoczRJpap54x5YuM2kQ05vcAaQBard7HDkCUq2lej4DSMPkHEdGcTX0xlxE7QH X79w==
ARC-Authentication-Results: i=1; mx.google.com; dkim=pass
 header.i=@lists.openembedded.org header.s=20140610 header.b=ojHrqixF;
 spf=pass (google.com: domain of
 bounce+67612+150667+1686473+8023802@lists.openembedded.org designates
 66.175.222.108 as permitted sender)
 smtp.mailfrom=bounce+67612+150667+1686473+8023802@lists.openembedded.org;
 dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail02.groups.io (mail02.groups.io. [66.175.222.108]) by
 mx.google.com with ESMTPS id a14si563782uas.255.2021.04.19.02.03.56 for
 <richard.purdie@linuxfoundation.org> (version=TLS1_3
 cipher=TLS_AES_128_GCM_SHA256 bits=128/128); Mon, 19 Apr 2021 02:03:56
 -0700 (PDT)
Received-SPF: pass (google.com: domain of
 bounce+67612+150667+1686473+8023802@lists.openembedded.org designates
 66.175.222.108 as permitted sender) client-ip=66.175.222.108;
Authentication-Results: mx.google.com; dkim=pass
 header.i=@lists.openembedded.org header.s=20140610 header.b=ojHrqixF;
 spf=pass (google.com: domain of
 bounce+67612+150667+1686473+8023802@lists.openembedded.org designates
 66.175.222.108 as permitted sender)
 smtp.mailfrom=bounce+67612+150667+1686473+8023802@lists.openembedded.org;
 dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
X-Received: by 127.0.0.2 with SMTP id 9OZwYY1687808x100lLlKNm6; Mon, 19 Apr
 2021 02:03:56 -0700
X-Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54]) by mx.groups.io with SMTP id
 smtpd.web10.6335.1618822854983782003 for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 02:00:55 -0700
X-Received: by mail-ej1-f54.google.com with SMTP id w23so35899713ejb.9 for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 02:00:54 -0700
 (PDT)
X-Received: by 2002:a17:906:fad8:: with SMTP id
 lu24mr20146956ejb.159.1618822853562; Mon, 19 Apr 2021 02:00:53 -0700 (PDT)
X-Received: from localhost.localdomain
 ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46]) by smtp.gmail.com with ESMTPSA
 id dc24sm3596474ejb.123.2021.04.19.02.00.52 (version=TLS1_3
 cipher=TLS_AES_256_GCM_SHA384 bits=256/256); Mon, 19 Apr 2021 02:00:53
 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [OE-core] [PATCH 4/4] dev-manual/common-tasks.rst: correct the
 documentation for debuginfod
Date: Mon, 19 Apr 2021 11:00:44 +0200
Message-Id: <20210419090044.582453-4-alex.kanavin@gmail.com>
In-Reply-To: <20210419090044.582453-1-alex.kanavin@gmail.com>
References: <20210419090044.582453-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe:
 <mailto:openembedded-core+unsubscribe@lists.openembedded.org>
List-Subscribe: <mailto:openembedded-core+subscribe@lists.openembedded.org>
List-Help: <mailto:openembedded-core+help@lists.openembedded.org>
Sender: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
Mailing-List: list openembedded-core@lists.openembedded.org; contact
 openembedded-core+owner@lists.openembedded.org
Delivered-To: mailing list openembedded-core@lists.openembedded.org
List-Post: <mailto:openembedded-core@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="escm8P75fUwOWTb1jzbX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.openembedded.org; q=dns/txt; s=20140610; t=1618823036;
 bh=zqiPpMzUA88FYhmCO0K2dxE3E74wibQVU93Ty3FYyH0=;
 h=Cc:Content-Type:Date:From:Subject:To;
 b=ojHrqixFrAePbooTDjhg6WjHapctrSZ6FQq/L5OChpuPuUy3XXF8nf7dBlzGWYE7EZD
 tlRodJIVaT5B1z+qeS7+BszShD6IoGxHDCBzmaU9xJNs9bmvpQVutFVvS6LGr6W2bUyeq
 7jlQiK8Bt76HVOJnR3tb+hUQq56nh3R6S9I=
X-Virus-Scanned: clamav-milter 0.102.3 at dan
X-Virus-Status: Clean


--escm8P75fUwOWTb1jzbX
Content-Transfer-Encoding: quoted-printable

Particularly,
- correctly describe the use of DEBUGINFOD_URLS; drop it from bitbake varia=
bles
- all necessary component tweaks are enabled by default via DISTRO_FEATURES
- provide on-target examples of what to look for when things work properly

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 documentation/dev-manual/common-tasks.rst | 34 +++++++++++++++--------
 documentation/ref-manual/variables.rst    |  6 ----
 2 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-=
manual/common-tasks.rst
index 176025f9e8..9f33b6b2c8 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -10005,34 +10005,44 @@ debug symbols from the server.
=20
 To run a debuginfod server, you need to do the following:
=20
--  Ensure that this variable is set in your ``local.conf`` file:
+-  Ensure that "debuginfod" is present in :term:`DISTRO_FEATURES
+   (it already is in oe-core defaults and poky reference distribution).
+   If not, set:
    ::
=20
-      PACKAGECONFIG_pn-elfutils-native =3D "debuginfod libdebuginfod"
+      DISTRO_FEATURES_append =3D " debuginfod"
=20
-   This :term:`PACKAGECONFIG` option enables debuginfod and libdebuginfod =
for
-   "elfutils-native".
+   This distro feature enables the server and client library in elfutils,
+   and enables debuginfod support in clients (at the moment, gdb and binut=
ils).
=20
--  Run the following commands to set up the "debuginfod" server:
+-  Run the following commands to launch the "debuginfod" server on the hos=
t:
    ::
=20
       $ oe-debuginfod
=20
+-  To use debuginfod on the target, you need to know the ip:port where
+   debuginfod is listening on the host (port defaults to 8002), and export
+   that into the shell environment, for example in qemu:
+   ::
=20
-To use debuginfod on the target, you need the following:
+      root@qemux86-64:~# export DEBUGINFOD_URLS=3D"http://192.168.7.1:8002=
/"
=20
--  Ensure that this variable is set in your ``local.conf`` file:
+-  Then debug info fetching should simply work when running the target gdb=
,
+   readelf or objdump, for example:
    ::
=20
-      DEBUGINFOD_URLS =3D "http://localhost:8002/"
-
-   This :term:`DEBUGINFOD_URLS` option does the client configuration.
+      root@qemux86-64:~# gdb /bin/cat
+      ...
+      Reading symbols from /bin/cat...
+      Downloading separate debug info for /bin/cat...
+      Reading symbols from /home/root/.cache/debuginfod_client/923dc4780cf=
bc545850c616bffa884b6b5eaf322/debuginfo...
=20
+-  It's also possible to use "debuginfod-find" to just query the server:
    ::
=20
-        PACKAGECONFIG_pn-gdb =3D "debuginfod"
+      root@qemux86-64:~# debuginfod-find debuginfo /bin/ls
+      /home/root/.cache/debuginfod_client/356edc585f7f82d46f94fcb87a86a3fe=
2d2e60bd/debuginfo
=20
-   This :term:`PACKAGECONFIG` option enables "debuginfod" for "gdb".
=20
 Using the gdbserver method
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 74ac12bf98..8a35b0960e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1563,12 +1563,6 @@ system and gives an overview of their function and c=
ontents.
=20
          DEBIANNAME_${PN} =3D "dbus-1"
=20
-   :term:`DEBUGINFOD_URLS`
-      Points to the URL of the "debuginfod" server. Such that for every
-      debugging information lookup, the debuginfod client will query the
-      server and return the requested information. You set this variable
-      in your ``local.conf`` file.
-
    :term:`DEBUG_BUILD`
       Specifies to build packages with debugging information. This
       influences the value of the ``SELECTED_OPTIMIZATION`` variable.
--=20
2.30.2

=0D
--escm8P75fUwOWTb1jzbX
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#150667): https://lists.openembedded.org/g/openembedded=
-core/message/150667
Mute This Topic: https://lists.openembedded.org/mt/82204271/1686473
Group Owner: openembedded-core+owner@lists.openembedded.org
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ric=
hard.purdie@linuxfoundation.org]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--escm8P75fUwOWTb1jzbX--


--=-zaDCNz6Ik5nh7AXNoOTJ--
