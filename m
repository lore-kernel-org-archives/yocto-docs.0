Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.7248.1605779940512003687
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 01:59:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kw425Mc6;
 spf=pass (domain: linaro.org, ip: 209.85.221.67, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f67.google.com with SMTP id m6so5735049wrg.7
        for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2020 01:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SQXCwUxZupY6FBAoCjbBcoW/6lRwIo2TUEae0XP+zgk=;
        b=kw425Mc6R9Uqtn4m4wHMoZ5/EXSzn8v5QRXNLX89JKCBSVNwDI03Plx/Zo6yMHVLB2
         ZzYcbKEIeX6WyC/n3QS+pa+uyJj11Fi7wQ7Y3hgVAa9zmYzW45+JoxuNMa7fKMArbUdS
         /Wxrnf6TWxPPcn9Lx4bbNpVUPQ4gOSd0Y/ZnRIeEOLSVS40mPPopEWjOzpJx4gDBXf/I
         u5BejcE+9ySBCJM2OQuj3JNux4yf3fA59WrrloC3QNSfLIG+zK+jcVw9wp/GedEqzpmh
         VkMIoJaUtsrs3zA9Sp1d2pjA35hj3uT6HR71oBp+clrzLTuEO3ss+nz5gV6onHwpI7fJ
         VpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SQXCwUxZupY6FBAoCjbBcoW/6lRwIo2TUEae0XP+zgk=;
        b=kO0uV5pcp0zNrChnkVbB48CRHg3Vp1J0Ref8XWxqnPg2CRFRrbr8dWv6nR+fS19B/X
         w9d3l6t9AFXciJ9FIvFEGFZD6fvLi1dW0AHIznHkR2aW3c2fLXsW4NkRgOd06UtSQdT9
         FsAfEGPexPz/K5UxtJXm6FTX0cihL0/r6TL+9g6VH5Vwr0aR9wiQR2ILRhzgcRUCdmGk
         cnqoyWW2+IVqrGONNO+a6Vko26i220/FzllhVK9UaAaiV5qgvm/QbhEWdeFbYmrm8Jo0
         9P4abOyT/XC7tK94yFn5hcnPSkwJIRdiu5nxv/AVaJiyJTEH9rNtXKp1Zx3YurQOKaF+
         Op2Q==
X-Gm-Message-State: AOAM533g7pM4UahYnAUhE/aYZ3ycn0eRocnI2ATtGddjioo7ogVENh6Q
	xpSU6Xf5LqbAP6DxoewaEk4mYxpQzatnIT1r
X-Google-Smtp-Source: ABdhPJw6O5ZtOFEUASpVm7qyyqiYFAI2l9FGYmGWzw5thBP8K2mb1ZLzyWluq1K8PLSDulBkeieaPA==
X-Received: by 2002:a5d:6550:: with SMTP id z16mr9269615wrv.266.1605779938605;
        Thu, 19 Nov 2020 01:58:58 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id o14sm34725288wrw.4.2020.11.19.01.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 01:58:57 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 09/11] profile-manual: remove unused labels
Date: Thu, 19 Nov 2020 10:58:32 +0100
Message-Id: <20201119095834.284864-10-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
References: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../profile-manual/profile-manual-intro.rst   |  4 --
 .../profile-manual/profile-manual-usage.rst   | 46 -------------------
 2 files changed, 50 deletions(-)

diff --git a/documentation/profile-manual/profile-manual-intro.rst b/documentation/profile-manual/profile-manual-intro.rst
index 0d435e0c0..4e1008b05 100644
--- a/documentation/profile-manual/profile-manual-intro.rst
+++ b/documentation/profile-manual/profile-manual-intro.rst
@@ -4,8 +4,6 @@
 Yocto Project Profiling and Tracing Manual
 ******************************************
 
-.. _profile-intro:
-
 Introduction
 ============
 
@@ -30,8 +28,6 @@ The final section of this 'HOWTO' is a collection of real-world examples
 which we'll be continually adding to as we solve more problems using the
 tools - feel free to add your own examples to the list!
 
-.. _profile-manual-general-setup:
-
 General Setup
 =============
 
diff --git a/documentation/profile-manual/profile-manual-usage.rst b/documentation/profile-manual/profile-manual-usage.rst
index d3c020a1c..cc403a554 100644
--- a/documentation/profile-manual/profile-manual-usage.rst
+++ b/documentation/profile-manual/profile-manual-usage.rst
@@ -10,8 +10,6 @@ Basic Usage (with examples) for each of the Yocto Tracing Tools
 This chapter presents basic usage examples for each of the tracing
 tools.
 
-.. _profile-manual-perf:
-
 perf
 ====
 
@@ -43,8 +41,6 @@ want to apply the tool; full documentation can be found either within
 the tool itself or in the man pages at
 `perf(1) <http://linux.die.net/man/1/perf>`__.
 
-.. _perf-setup:
-
 Perf Setup
 ----------
 
@@ -61,8 +57,6 @@ profile data and copy it to the host for analysis, but for the rest of
 this document we assume you've ssh'ed to the host and will be running
 the perf commands on the target.
 
-.. _perf-basic-usage:
-
 Basic Perf Usage
 ----------------
 
@@ -950,8 +944,6 @@ We can look at the raw output using 'perf script' with no arguments: ::
        kworker/1:1    21 [001]  6171.470082: sched_switch: prev_comm=kworker/1:1 prev_pid=21 prev_prio=120 prev_state=S ==> next_comm=perf next_pid=1383 next_prio=120
               perf  1383 [001]  6171.480035: sched_wakeup: comm=kworker/1:1 pid=21 prio=120 success=1 target_cpu=001
 
-.. _perf-filtering:
-
 Filtering
 ^^^^^^^^^
 
@@ -1138,8 +1130,6 @@ callgraphs from starting a few programs during those 30 seconds:
    uprobes. kprobes and uprobes are also used by and in fact are the
    main focus of SystemTap.
 
-.. _perf-documentation:
-
 Perf Documentation
 ------------------
 
@@ -1182,8 +1172,6 @@ There's also a nice perf tutorial on the perf
 wiki that goes into more detail than we do here in certain areas: `Perf
 Tutorial <https://perf.wiki.kernel.org/index.php/Tutorial>`__
 
-.. _profile-manual-ftrace:
-
 ftrace
 ======
 
@@ -1191,8 +1179,6 @@ ftrace
 this encompasses a number of related tracers along with the
 infrastructure that they all make use of.
 
-.. _ftrace-setup:
-
 ftrace Setup
 ------------
 
@@ -1668,8 +1654,6 @@ trace-cmd and kernelshark in the next section.
    /sys/kernel/debug/tracing will be removed and replaced with
    equivalent tracers based on the 'trace events' subsystem.
 
-.. _trace-cmd-kernelshark:
-
 trace-cmd/kernelshark
 ---------------------
 
@@ -1737,8 +1721,6 @@ The tool is pretty self-explanatory, but for more detailed information
 on navigating through the data, see the `kernelshark
 website <http://rostedt.homelinux.com/kernelshark/>`__.
 
-.. _ftrace-documentation:
-
 ftrace Documentation
 --------------------
 
@@ -1772,8 +1754,6 @@ There's more detailed documentation kernelshark usage here:
 An amusing yet useful README (a tracing mini-HOWTO) can be found in
 ``/sys/kernel/debug/tracing/README``.
 
-.. _profile-manual-systemtap:
-
 systemtap
 =========
 
@@ -1835,8 +1815,6 @@ target system and 3) insert the module into the target kernel, which
 arms it, and 4) collect the data generated by the probe and display it
 to the user.
 
-.. _systemtap-setup:
-
 systemtap Setup
 ---------------
 
@@ -1955,8 +1933,6 @@ no password):
    matchbox-termin(1036) open ("/tmp/vte3FS2LW", O_RDWR|O_CREAT|O_EXCL|O_LARGEFILE, 0600)
    matchbox-termin(1036) open ("/tmp/vteJMC7LW", O_RDWR|O_CREAT|O_EXCL|O_LARGEFILE, 0600)
 
-.. _systemtap-documentation:
-
 systemtap Documentation
 -----------------------
 
@@ -1967,8 +1943,6 @@ Links to other SystemTap documents, tutorials, and examples can be found
 here: `SystemTap documentation
 page <http://sourceware.org/systemtap/documentation.html>`__
 
-.. _profile-manual-sysprof:
-
 Sysprof
 =======
 
@@ -1976,8 +1950,6 @@ Sysprof is a very easy to use system-wide profiler that consists of a
 single window with three panes and a few buttons which allow you to
 start, stop, and view the profile from one place.
 
-.. _sysprof-setup:
-
 Sysprof Setup
 -------------
 
@@ -1990,8 +1962,6 @@ be running Sysprof on the target (you can use the '-X' option to ssh and
 have the Sysprof GUI run on the target but display remotely on the host
 if you want).
 
-.. _sysprof-basic-usage:
-
 Basic Sysprof Usage
 -------------------
 
@@ -2040,8 +2010,6 @@ to the selected function, and so on.
    the -g (--call-graph) option that you can experiment with; one of the
    options is 'caller' for an inverted caller-based callgraph display.
 
-.. _sysprof-documentation:
-
 Sysprof Documentation
 ---------------------
 
@@ -2053,8 +2021,6 @@ Linux <http://sysprof.com/>`__
 LTTng (Linux Trace Toolkit, next generation)
 ============================================
 
-.. _lttng-setup:
-
 LTTng Setup
 -----------
 
@@ -2239,8 +2205,6 @@ trace - it's still there in ~/lttng-traces): ::
    root@crownbay:~# lttng destroy
    Session auto-20190303-021943 destroyed at /home/root
 
-.. _lltng-documentation:
-
 LTTng Documentation
 -------------------
 
@@ -2254,8 +2218,6 @@ For information on LTTng in general, visit the `LTTng
 Project <http://lttng.org/lttng2.0>`__ site. You can find a "Getting
 Started" link on this site that takes you to an LTTng Quick Start.
 
-.. _profile-manual-blktrace:
-
 blktrace
 ========
 
@@ -2264,8 +2226,6 @@ blktrace provides the tracing half of the equation; its output can be
 piped into the blkparse program, which renders the data in a
 human-readable form and does some basic analysis:
 
-.. _blktrace-setup:
-
 blktrace Setup
 --------------
 
@@ -2281,8 +2241,6 @@ collect and analyze the data on the host (see the
 below). For the rest of this section we assume you've ssh'ed to the host and
 will be running blkrace on the target.
 
-.. _blktrace-basic-usage:
-
 Basic blktrace Usage
 --------------------
 
@@ -2411,8 +2369,6 @@ I/O traffic during the run. You can look at the
 `blkparse <http://linux.die.net/man/1/blkparse>`__ manpage to learn the
 meaning of each field displayed in the trace listing.
 
-.. _blktrace-live-mode:
-
 Live Mode
 ~~~~~~~~~
 
@@ -2603,8 +2559,6 @@ And this turns off tracing for the specified device: ::
 
    root@crownbay:/sys/kernel/debug/tracing# echo 0 > /sys/block/sdc/trace/enable
 
-.. _blktrace-documentation:
-
 blktrace Documentation
 ----------------------
 
-- 
2.29.2

