Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.14123.1594623214288032001
 for <docs@lists.yoctoproject.org>;
 Sun, 12 Jul 2020 23:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AhJV+zDT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id z15so14328629wrl.8
        for <docs@lists.yoctoproject.org>; Sun, 12 Jul 2020 23:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=iOwviCGv8J3R2KcJzsNRM3SP+N54c26P3NfKA1xIR0Q=;
        b=AhJV+zDTBYg3XXdg32ZaFTNBwPkjd6/LudEsru4EphFnO7cieMkGdmUNFL6nIB/6xC
         bJHt/zjIiMQ60o8/ZxnsUS2DP76SyVhE0qs9VJg/yrbhTQCtHYtr068q8xZSlOLqyNyI
         hHI45odkleYsm5R4YVF708lXzmmn7dcsQBJGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iOwviCGv8J3R2KcJzsNRM3SP+N54c26P3NfKA1xIR0Q=;
        b=HkS1edUV9mHHrlceaRyj6moopKB6jOScuzJyM9ct4yRRy4bQXCpcbcialNXdRrNAXB
         OcPObQKTTQDn1KtOMwufUH+4mFiaj54E5xM9hbp+uno990cP+Sht6u9wgY5v1XnHRB2Z
         C2s4QEKC8bu+OjiUmQR4/WwrOmLN1QFwvY9sy+qpPt/2rBvVxa+63KaP/L3EyUWa+IPd
         GLlzk/w5G9wRjD0BYwEYvgxSauoc4yECJsiCQb5fsesnLL4L4/QsoROarZIahp8bG1A8
         7M8Te+4lv8mkhxupC7HngWOY22UM9AkFHfwIVhWwMEEhTfTdDGBD8WMZJs8siNnvtW6e
         66Ww==
X-Gm-Message-State: AOAM5300cI/OAVXQosdOAPEBhgYYoJj1eWHSMESmGegdhnXvg+Nnt+jI
	rQ47tSKs07sF/BGMscVE2gDVXg==
X-Google-Smtp-Source: ABdhPJzRkAzK3MWIYo/nl3Lz8B0r1loY9jPBzy2sP5DjiGrrwUzTgsWafuBgKZVfz6sPIwrpBoGmZA==
X-Received: by 2002:adf:84e2:: with SMTP id 89mr81568959wrg.139.1594623212651;
        Sun, 12 Jul 2020 23:53:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id q5sm22726910wrp.60.2020.07.12.23.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 23:53:31 -0700 (PDT)
Message-ID: <8b05a52663dce26300ae56c1ed2a7ba24936f2aa.camel@linuxfoundation.org>
Subject: Re: [docs] About spdx part in docs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: leimaohui <leimaohui@cn.fujitsu.com>, docs@lists.yoctoproject.org
Date: Mon, 13 Jul 2020 07:53:30 +0100
In-Reply-To: <wvbX.1594093435889989965.leYQ@lists.yoctoproject.org>
References: <wvbX.1594093435889989965.leYQ@lists.yoctoproject.org>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 2020-07-06 at 20:43 -0700, leimaohui wrote:
> In docs of YP, the section of spdx is still about how to use
> spdx.bbclass. But spdx.bbclass is too old to use.
> 
> New layer meta-spdxscanner has been added into YP repo. So, how about
> adding meta-spdxscanner(
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-spdxscanner/) into
> "MEGA MANUALS" and "REFERENCE MANUALS"?

I'd happily see this documented, patches gratefully received!

Based on this email, I also removed sdpx.bbclass from OE-Core so we can
remove mention of that from the manual now too.

Cheers,

Richard



