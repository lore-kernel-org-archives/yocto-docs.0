Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.10722.1585067352532447989
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Mar 2020 09:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Abu/vWfb;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id g2so7598973plo.3
        for <docs@lists.yoctoproject.org>; Tue, 24 Mar 2020 09:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=84MZERhoMs19JoeQ3/GJ1mHb/ityaf7C0PrdXn3pgrU=;
        b=Abu/vWfb103mdWaZyCPTS/O6FAQzvg+UfvSvfJpAxu55jdopEPWTAlWt6cm8xSRKCs
         8qXYJby+oQifxRFrjU6u+iWxh3s2ebg3DF/w1dh4Z7IidF/OXgtYnj6BiNuEagthBhDM
         zE4SvQm1OM8s0z61XlCzPzzieZ4pbqyobpfkcfMo9Tpyy0rDEIh43UQa3jmx3T+FlM47
         6XoztE8N82BBNzeqTl9fmpFXgYmwpXTgA+jDdDlU6DSfy80npBvXtm2tkqJc55xjlkZD
         orvJX4Ern2pAGezOHUclKioWPecYhmgq0IrQrQkl4rqKNQZElDUPPOaVULB8S5A29KoQ
         BKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=84MZERhoMs19JoeQ3/GJ1mHb/ityaf7C0PrdXn3pgrU=;
        b=o8wDYgSQl2LXnIb5huxhQAoXsXlogyLyxDQ7fP5Q+1Dg/wBObtDE9ritco5WKFWnQL
         iQKaT3Qb2C2KGN9EaMz4Ofor8QlSXFyaEuIR1Ops+vuTGYQgSYnigm1LTTbMbO6sRxQW
         /wd3TWcvYN3LAz0IBHzz5cjQNMpt4MqPMRqKGgFfZzN8a4FvzqSC2j+tt71P7OwXHa9k
         JfMmleCQgFWnw4BgNo+N+ed200RzietYQipf1ehODfzWdE4XaUeCS2q+EkkV1YNOwyaU
         CmBgZDDdnvxfFOE7bBi6fLGhMetJVonwF8BujkojHkFDUD88kdQFThFaeYY8BAOXiDW2
         Rz8g==
X-Gm-Message-State: ANhLgQ0p2fDwH88xZddRvau7mBdKg1oW8XSFmyb1zZ5ugzRcpZlJqsOA
	uwV/mgxGyuziG6LZyeViuWZuhSxWhfM=
X-Google-Smtp-Source: ADFU+vtiCzYGRkQ/pGs3KzEEaW/SrHlvBb4UCj8pGa/BaQOPXCv4M+fVeLWVy4S5w92W+O6SvPg9iQ==
X-Received: by 2002:a17:902:ba93:: with SMTP id k19mr26623137pls.73.1585067351524;
        Tue, 24 Mar 2020 09:29:11 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:cc84:c3a2:bb8c:e448? ([2601:202:4180:a5c0:cc84:c3a2:bb8c:e448])
        by smtp.gmail.com with ESMTPSA id b70sm16614317pfb.6.2020.03.24.09.29.10
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2020 09:29:10 -0700 (PDT)
Subject: Re: [docs] [PATCH] yocto-docs: remove refrence to mpc8315e-rdb
To: docs@lists.yoctoproject.org
References: <15F7068EAEB826C7.23465@lists.yoctoproject.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <f95be9fb-403f-c1dd-6616-5938eec7fbbe@gmail.com>
Date: Tue, 24 Mar 2020 09:29:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <15F7068EAEB826C7.23465@lists.yoctoproject.org>
Content-Type: multipart/alternative;
 boundary="------------5238942B2495D23665E8A05B"
Content-Language: en-US

--------------5238942B2495D23665E8A05B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Are there issues with these changes?



On 2/26/20 10:16 AM, akuster via Lists.Yoctoproject.Org wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  documentation/bsp-guide/bsp.xml                       | 8 --------
>  documentation/dev-manual/dev-manual-common-tasks.xml  | 2 --
>  documentation/kernel-dev/kernel-dev-common.xml        | 4 ----
>  documentation/kernel-dev/kernel-dev-concepts-appx.xml | 1 -
>  documentation/ref-manual/ref-variables.xml            | 2 --
>  documentation/sdk-manual/sdk-appendix-obtain.xml      | 3 +--
>  6 files changed, 1 insertion(+), 19 deletions(-)
>
> diff --git a/documentation/bsp-guide/bsp.xml b/documentation/bsp-guide/bsp.xml
> index 3a3186f19..258b4c674 100644
> --- a/documentation/bsp-guide/bsp.xml
> +++ b/documentation/bsp-guide/bsp.xml
> @@ -1075,10 +1075,6 @@
>                                      Texas Instruments Beaglebone
>                                      (<filename>beaglebone-yocto</filename>)
>                                      </para></listitem>
> -                                <listitem><para>
> -                                    Freescale MPC8315E-RDB
> -                                    (<filename>mpc8315e-rdb</filename>)
> -                                    </para></listitem>
>                                  <listitem><para>
>                                      Ubiquiti Networks EdgeRouter Lite
>                                     (<filename>edgerouter</filename>)
> @@ -2183,7 +2179,6 @@
>       KBRANCH_genericx86-64  = "v5.0/standard/base"
>       KBRANCH_edgerouter = "v5.0/standard/edgerouter"
>       KBRANCH_beaglebone-yocto = "v5.0/standard/beaglebone"
> -     KBRANCH_mpc8315e-rdb = "v5.0/standard/fsl-mpc8315e-rdb"
>  
>       KMACHINE_genericx86 ?= "common-pc"
>       KMACHINE_genericx86-64 ?= "common-pc-64"
> @@ -2193,19 +2188,16 @@
>       SRCREV_machine_genericx86-64 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
>       SRCREV_machine_edgerouter ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
>       SRCREV_machine_beaglebone-yocto ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
> -     SRCREV_machine_mpc8315e-rdb ?= "8b62af7f252af10588276802c4c6d7c502e875be"
>  
>       COMPATIBLE_MACHINE_genericx86 = "genericx86"
>       COMPATIBLE_MACHINE_genericx86-64 = "genericx86-64"
>       COMPATIBLE_MACHINE_edgerouter = "edgerouter"
>       COMPATIBLE_MACHINE_beaglebone-yocto = "beaglebone-yocto"
> -     COMPATIBLE_MACHINE_mpc8315e-rdb = "mpc8315e-rdb"
>  
>       LINUX_VERSION_genericx86 = "5.0.3"
>       LINUX_VERSION_genericx86-64 = "5.0.3"
>       LINUX_VERSION_edgerouter = "5.0.3"
>       LINUX_VERSION_beaglebone-yocto = "5.0.3"
> -     LINUX_VERSION_mpc8315e-rdb = "5.0.3"
>              </literallayout>
>              This particular append file works for all the
>              machines that are part of the
> diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
> index 9da92e86a..e32329b88 100644
> --- a/documentation/dev-manual/dev-manual-common-tasks.xml
> +++ b/documentation/dev-manual/dev-manual-common-tasks.xml
> @@ -7609,7 +7609,6 @@
>                  available Wic images as follows:
>                  <literallayout class='monospaced'>
>       $ wic list images
> -       mpc8315e-rdb                  		Create SD card image for MPC8315E-RDB
>         genericx86                    		Create an EFI disk image for genericx86*
>         beaglebone-yocto              		Create SD card image for Beaglebone
>         edgerouter                    		Create SD card image for Edgerouter
> @@ -7797,7 +7796,6 @@
>                  files:
>                  <literallayout class='monospaced'>
>       $ wic list images
> -       mpc8315e-rdb                  		Create SD card image for MPC8315E-RDB
>         genericx86                    		Create an EFI disk image for genericx86*
>         beaglebone-yocto              		Create SD card image for Beaglebone
>         edgerouter                    		Create SD card image for Edgerouter
> diff --git a/documentation/kernel-dev/kernel-dev-common.xml b/documentation/kernel-dev/kernel-dev-common.xml
> index d94ed1942..579a03537 100644
> --- a/documentation/kernel-dev/kernel-dev-common.xml
> +++ b/documentation/kernel-dev/kernel-dev-common.xml
> @@ -659,26 +659,22 @@
>       KMACHINE_genericx86-64 ?= "common-pc-64"
>       KBRANCH_edgerouter = "standard/edgerouter"
>       KBRANCH_beaglebone = "standard/beaglebone"
> -     KBRANCH_mpc8315e-rdb = "standard/fsl-mpc8315e-rdb"
>  
>       SRCREV_machine_genericx86    ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
>       SRCREV_machine_genericx86-64 ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
>       SRCREV_machine_edgerouter ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
>       SRCREV_machine_beaglebone ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
> -     SRCREV_machine_mpc8315e-rdb ?= "2d1d010240846d7bff15d1fcc0cb6eb8a22fc78a"
>  
>  
>       COMPATIBLE_MACHINE_genericx86 = "genericx86"
>       COMPATIBLE_MACHINE_genericx86-64 = "genericx86-64"
>       COMPATIBLE_MACHINE_edgerouter = "edgerouter"
>       COMPATIBLE_MACHINE_beaglebone = "beaglebone"
> -     COMPATIBLE_MACHINE_mpc8315e-rdb = "mpc8315e-rdb"
>  
>       LINUX_VERSION_genericx86 = "4.12.7"
>       LINUX_VERSION_genericx86-64 = "4.12.7"
>       LINUX_VERSION_edgerouter = "4.12.10"
>       LINUX_VERSION_beaglebone = "4.12.10"
> -     LINUX_VERSION_mpc8315e-rdb = "4.12.10"
>                  </literallayout>
>                  This append file contains statements used to support
>                  several BSPs that ship with the Yocto Project.
> diff --git a/documentation/kernel-dev/kernel-dev-concepts-appx.xml b/documentation/kernel-dev/kernel-dev-concepts-appx.xml
> index 6d675a6d5..62c68527d 100644
> --- a/documentation/kernel-dev/kernel-dev-concepts-appx.xml
> +++ b/documentation/kernel-dev/kernel-dev-concepts-appx.xml
> @@ -543,7 +543,6 @@
>       yocto-kernel-cache/features/kgdb/hardware.cfg
>       yocto-kernel-cache/ktypes/base/hardware.cfg
>       yocto-kernel-cache/bsp/mti-malta32/hardware.cfg
> -     yocto-kernel-cache/bsp/fsl-mpc8315e-rdb/hardware.cfg
>       yocto-kernel-cache/bsp/qemu-ppc32/hardware.cfg
>       yocto-kernel-cache/bsp/qemuarma9/hardware.cfg
>       yocto-kernel-cache/bsp/mti-malta64/hardware.cfg
> diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
> index 7ab37de31..c8ee50a09 100644
> --- a/documentation/ref-manual/ref-variables.xml
> +++ b/documentation/ref-manual/ref-variables.xml
> @@ -7471,7 +7471,6 @@
>       KBRANCH_genericx86-64  = "standard/base"
>       KBRANCH_edgerouter = "standard/edgerouter"
>       KBRANCH_beaglebone = "standard/beaglebone"
> -     KBRANCH_mpc8315e-rdb = "standard/fsl-mpc8315e-rdb"
>                      </literallayout>
>                          The <filename>KBRANCH</filename> statements identify
>                          the kernel branch to use when building for each
> @@ -8789,7 +8788,6 @@
>       MACHINE ?= "genericx86"
>       MACHINE ?= "genericx86-64"
>       MACHINE ?= "beaglebone"
> -     MACHINE ?= "mpc8315e-rdb"
>       MACHINE ?= "edgerouter"
>                      </literallayout>
>                      The last five are Yocto Project reference hardware boards, which
> diff --git a/documentation/sdk-manual/sdk-appendix-obtain.xml b/documentation/sdk-manual/sdk-appendix-obtain.xml
> index 765c0f218..86b6d7dd0 100644
> --- a/documentation/sdk-manual/sdk-appendix-obtain.xml
> +++ b/documentation/sdk-manual/sdk-appendix-obtain.xml
> @@ -297,8 +297,7 @@
>  
>           <replaceable>arch</replaceable> is a string representing the target architecture:
>                     beaglebone-yocto, beaglebone-yocto-lsb, edgerouter, edgerouter-lsb,
> -                   genericx86, genericx86-64, genericx86-64-lsb, genericx86-lsb,
> -                   mpc8315e-rdb, mpc8315e-rdb-lsb, and qemu*.
> +                   genericx86, genericx86-64, genericx86-64-lsb, genericx86-lsb and qemu*.
>  
>  <!-->
>           <replaceable>date_time</replaceable> is a date and time stamp.
>
> 


--------------5238942B2495D23665E8A05B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Are there issues with these changes?<br>
    <br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2/26/20 10:16 AM, akuster via
      Lists.Yoctoproject.Org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:15F7068EAEB826C7.23465@lists.yoctoproject.org">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a>
---
 documentation/bsp-guide/bsp.xml                       | 8 --------
 documentation/dev-manual/dev-manual-common-tasks.xml  | 2 --
 documentation/kernel-dev/kernel-dev-common.xml        | 4 ----
 documentation/kernel-dev/kernel-dev-concepts-appx.xml | 1 -
 documentation/ref-manual/ref-variables.xml            | 2 --
 documentation/sdk-manual/sdk-appendix-obtain.xml      | 3 +--
 6 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/documentation/bsp-guide/bsp.xml b/documentation/bsp-guide/bsp.xml
index 3a3186f19..258b4c674 100644
--- a/documentation/bsp-guide/bsp.xml
+++ b/documentation/bsp-guide/bsp.xml
@@ -1075,10 +1075,6 @@
                                     Texas Instruments Beaglebone
                                     (&lt;filename&gt;beaglebone-yocto&lt;/filename&gt;)
                                     &lt;/para&gt;&lt;/listitem&gt;
-                                &lt;listitem&gt;&lt;para&gt;
-                                    Freescale MPC8315E-RDB
-                                    (&lt;filename&gt;mpc8315e-rdb&lt;/filename&gt;)
-                                    &lt;/para&gt;&lt;/listitem&gt;
                                 &lt;listitem&gt;&lt;para&gt;
                                     Ubiquiti Networks EdgeRouter Lite
                                    (&lt;filename&gt;edgerouter&lt;/filename&gt;)
@@ -2183,7 +2179,6 @@
      KBRANCH_genericx86-64  = "v5.0/standard/base"
      KBRANCH_edgerouter = "v5.0/standard/edgerouter"
      KBRANCH_beaglebone-yocto = "v5.0/standard/beaglebone"
-     KBRANCH_mpc8315e-rdb = "v5.0/standard/fsl-mpc8315e-rdb"
 
      KMACHINE_genericx86 ?= "common-pc"
      KMACHINE_genericx86-64 ?= "common-pc-64"
@@ -2193,19 +2188,16 @@
      SRCREV_machine_genericx86-64 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
      SRCREV_machine_edgerouter ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
      SRCREV_machine_beaglebone-yocto ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-     SRCREV_machine_mpc8315e-rdb ?= "8b62af7f252af10588276802c4c6d7c502e875be"
 
      COMPATIBLE_MACHINE_genericx86 = "genericx86"
      COMPATIBLE_MACHINE_genericx86-64 = "genericx86-64"
      COMPATIBLE_MACHINE_edgerouter = "edgerouter"
      COMPATIBLE_MACHINE_beaglebone-yocto = "beaglebone-yocto"
-     COMPATIBLE_MACHINE_mpc8315e-rdb = "mpc8315e-rdb"
 
      LINUX_VERSION_genericx86 = "5.0.3"
      LINUX_VERSION_genericx86-64 = "5.0.3"
      LINUX_VERSION_edgerouter = "5.0.3"
      LINUX_VERSION_beaglebone-yocto = "5.0.3"
-     LINUX_VERSION_mpc8315e-rdb = "5.0.3"
             &lt;/literallayout&gt;
             This particular append file works for all the
             machines that are part of the
diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index 9da92e86a..e32329b88 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -7609,7 +7609,6 @@
                 available Wic images as follows:
                 &lt;literallayout class='monospaced'&gt;
      $ wic list images
-       mpc8315e-rdb                  		Create SD card image for MPC8315E-RDB
        genericx86                    		Create an EFI disk image for genericx86*
        beaglebone-yocto              		Create SD card image for Beaglebone
        edgerouter                    		Create SD card image for Edgerouter
@@ -7797,7 +7796,6 @@
                 files:
                 &lt;literallayout class='monospaced'&gt;
      $ wic list images
-       mpc8315e-rdb                  		Create SD card image for MPC8315E-RDB
        genericx86                    		Create an EFI disk image for genericx86*
        beaglebone-yocto              		Create SD card image for Beaglebone
        edgerouter                    		Create SD card image for Edgerouter
diff --git a/documentation/kernel-dev/kernel-dev-common.xml b/documentation/kernel-dev/kernel-dev-common.xml
index d94ed1942..579a03537 100644
--- a/documentation/kernel-dev/kernel-dev-common.xml
+++ b/documentation/kernel-dev/kernel-dev-common.xml
@@ -659,26 +659,22 @@
      KMACHINE_genericx86-64 ?= "common-pc-64"
      KBRANCH_edgerouter = "standard/edgerouter"
      KBRANCH_beaglebone = "standard/beaglebone"
-     KBRANCH_mpc8315e-rdb = "standard/fsl-mpc8315e-rdb"
 
      SRCREV_machine_genericx86    ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
      SRCREV_machine_genericx86-64 ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
      SRCREV_machine_edgerouter ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
      SRCREV_machine_beaglebone ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
-     SRCREV_machine_mpc8315e-rdb ?= "2d1d010240846d7bff15d1fcc0cb6eb8a22fc78a"
 
 
      COMPATIBLE_MACHINE_genericx86 = "genericx86"
      COMPATIBLE_MACHINE_genericx86-64 = "genericx86-64"
      COMPATIBLE_MACHINE_edgerouter = "edgerouter"
      COMPATIBLE_MACHINE_beaglebone = "beaglebone"
-     COMPATIBLE_MACHINE_mpc8315e-rdb = "mpc8315e-rdb"
 
      LINUX_VERSION_genericx86 = "4.12.7"
      LINUX_VERSION_genericx86-64 = "4.12.7"
      LINUX_VERSION_edgerouter = "4.12.10"
      LINUX_VERSION_beaglebone = "4.12.10"
-     LINUX_VERSION_mpc8315e-rdb = "4.12.10"
                 &lt;/literallayout&gt;
                 This append file contains statements used to support
                 several BSPs that ship with the Yocto Project.
diff --git a/documentation/kernel-dev/kernel-dev-concepts-appx.xml b/documentation/kernel-dev/kernel-dev-concepts-appx.xml
index 6d675a6d5..62c68527d 100644
--- a/documentation/kernel-dev/kernel-dev-concepts-appx.xml
+++ b/documentation/kernel-dev/kernel-dev-concepts-appx.xml
@@ -543,7 +543,6 @@
      yocto-kernel-cache/features/kgdb/hardware.cfg
      yocto-kernel-cache/ktypes/base/hardware.cfg
      yocto-kernel-cache/bsp/mti-malta32/hardware.cfg
-     yocto-kernel-cache/bsp/fsl-mpc8315e-rdb/hardware.cfg
      yocto-kernel-cache/bsp/qemu-ppc32/hardware.cfg
      yocto-kernel-cache/bsp/qemuarma9/hardware.cfg
      yocto-kernel-cache/bsp/mti-malta64/hardware.cfg
diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 7ab37de31..c8ee50a09 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -7471,7 +7471,6 @@
      KBRANCH_genericx86-64  = "standard/base"
      KBRANCH_edgerouter = "standard/edgerouter"
      KBRANCH_beaglebone = "standard/beaglebone"
-     KBRANCH_mpc8315e-rdb = "standard/fsl-mpc8315e-rdb"
                     &lt;/literallayout&gt;
                         The &lt;filename&gt;KBRANCH&lt;/filename&gt; statements identify
                         the kernel branch to use when building for each
@@ -8789,7 +8788,6 @@
      MACHINE ?= "genericx86"
      MACHINE ?= "genericx86-64"
      MACHINE ?= "beaglebone"
-     MACHINE ?= "mpc8315e-rdb"
      MACHINE ?= "edgerouter"
                     &lt;/literallayout&gt;
                     The last five are Yocto Project reference hardware boards, which
diff --git a/documentation/sdk-manual/sdk-appendix-obtain.xml b/documentation/sdk-manual/sdk-appendix-obtain.xml
index 765c0f218..86b6d7dd0 100644
--- a/documentation/sdk-manual/sdk-appendix-obtain.xml
+++ b/documentation/sdk-manual/sdk-appendix-obtain.xml
@@ -297,8 +297,7 @@
 
          &lt;replaceable&gt;arch&lt;/replaceable&gt; is a string representing the target architecture:
                    beaglebone-yocto, beaglebone-yocto-lsb, edgerouter, edgerouter-lsb,
-                   genericx86, genericx86-64, genericx86-64-lsb, genericx86-lsb,
-                   mpc8315e-rdb, mpc8315e-rdb-lsb, and qemu*.
+                   genericx86, genericx86-64, genericx86-64-lsb, genericx86-lsb and qemu*.
 
 &lt;!--&gt;
          &lt;replaceable&gt;date_time&lt;/replaceable&gt; is a date and time stamp.
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------5238942B2495D23665E8A05B--
