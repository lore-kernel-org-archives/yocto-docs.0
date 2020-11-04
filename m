Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web09.11042.1604485164508070750
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Nov 2020 02:19:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kWgeMzlx;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: carlsb3rg@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id i6so26439253lfd.1
        for <docs@lists.yoctoproject.org>; Wed, 04 Nov 2020 02:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=K7t6Aj1X8aTZDLzPBV/9yh/KgyUZ880Lk/Ewx9xH9Yk=;
        b=kWgeMzlxra8fLNK/utDCmATJ7eLwRFwIrQbmGmPRQuWFffLaJTjA0tfKTrb1+NwyME
         uaAU0PyKLqXOlmuno2GUjExGEHrz6rzcbiyXGmdbipz3GSd88GBXHF/ufFq3sH809QZm
         fyyZUag5XUfM+fF/tvuvwoVq4qf6mCTUnDUJakxuac2Yrv7yt4AUj7G9UxjIQVq9wnUN
         OFtSOTzNGa5U/RTt0WKFqk0ROROafumAkm2v6UkV3lYvLcyxXp8sCPV0rgzZ70JlyTkb
         rUlcZ/wB2JfS2zh5ITZnEQ6rerbX21AKE+rC0HQg4p9+tOzTJBCixpIEDI+7aRSk5uaj
         MSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=K7t6Aj1X8aTZDLzPBV/9yh/KgyUZ880Lk/Ewx9xH9Yk=;
        b=SSVFLBLUc0Df4okzTk9z9K/EqM9baXaMPUzY7xrnJAWMIlCtAwuQxUxzTGvz3fVmX9
         yrjzhpgPAgcecgKZ9RQItJ3XFp/fCAvOLT+f1l+5Fe+algjjaNSy9L9TtlctmN9H/HBm
         sFf22Iwa8WkH/EJse40xLfFn/vXVSKLnIsmc7hKt0+7QPf8Xs8Z2xzdzxru66uhON1IV
         zJc1ktoTPioV5NVSBFKbZdVubUJcFg3oMJcGZIyL8D9NJKyfFEJja7eEvx9GEUO2UKzr
         SBmGTl+RE1KF/A75b6tTQ00oln7AwYNaqrU+7Hu+eUBXeTxRZ8LKJrKn2m/1vj6Xtf/M
         5wDg==
X-Gm-Message-State: AOAM533QpPEiTkuuBJw/crFOEZevZ89NdVSkSytU3gxejAqgm0RSRCtl
	2S8lLaECtnySv4VGnnTyki4sRcdZgAiLtsp3Nv1KCw9l7Nu+qQ==
X-Google-Smtp-Source: ABdhPJwjTynnZ2PWNjpD4MYZOpu7/Cb50zEbXmaTLhJJTp30ZnNvTm+pAktAKS/mbw+uGTLY+5ppTo4D3rkDVn/RRSY=
X-Received: by 2002:ac2:52b8:: with SMTP id r24mr5561807lfm.312.1604485162577;
 Wed, 04 Nov 2020 02:19:22 -0800 (PST)
MIME-Version: 1.0
From: "carlsb3rg" <carlsb3rg@gmail.com>
Date: Wed, 4 Nov 2020 11:17:23 +0100
Message-ID: <CALYP1JpSZF0JEuLZ_eJ4bp2GPVJbQvg1Kp_ta705B_ip2e_Qkg@mail.gmail.com>
Subject: Possible error in reference manual
To: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000029b43905b34550ca"

--00000000000029b43905b34550ca
Content-Type: text/plain; charset="UTF-8"

Hi,

In the reference manual under the section "module_conf", it says "If you
use this variable, you must also be sure to list the module name in the
KERNEL_MODULE_AUTOLOAD variable.". Shouldn't this read "...the
KERNEL_MODULE_PROBECONF variable."?

Best regards,
carlsb3rg

--00000000000029b43905b34550ca
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>Hi,</div><div><br></div><div>In the reference manual under the 
section &quot;module_conf&quot;, it says &quot;If you use this variable, you must also 
be sure to list the module name in the KERNEL_MODULE_AUTOLOAD 
variable.&quot;. Shouldn&#39;t this read &quot;...the KERNEL_MODULE_PROBECONF 
variable.&quot;?</div><div><br></div><div>Best regards,</div><div>carlsb3rg</div><div><br></div></div>

--00000000000029b43905b34550ca--
