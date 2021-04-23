Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.1268.1619192966535212064
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Apr 2021 08:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W2h+s2t+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id k128so26273144wmk.4
        for <docs@lists.yoctoproject.org>; Fri, 23 Apr 2021 08:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=IsR7M6r55CksCu22ULCsOZ3UGM9hLXcTaKSYSI2hqOc=;
        b=W2h+s2t+W444TSAi8QxGCDMQhNxwQ7iQS3KUX8mvW9xCXqVlol8JziOzZeix1t5RW5
         bxvfAHMTWPy8AMwt/oBiQrv29mZtJq7qCCdG/sPP65uO/I5RT5jxK7NdRH52zAWnPjNB
         NAYyZeIzGHntin34WStovzSHWE6y4gZ+URR5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=IsR7M6r55CksCu22ULCsOZ3UGM9hLXcTaKSYSI2hqOc=;
        b=TazOwyJo+W/EKw0C0xGJzyXVD+uXyk2lNwVbkY9zyipotXK0pltpK/gOXlLTKbZkfP
         xjhyKcKp0ebAC4KDCyFH29Ljc7Le+VB05vRN+VdqhNhM4WW/GTMGPx+uxO9iN26U5bze
         ifxzs2rINeHReeCDGAd3dcnhZ4VPQS3BK4TsDdEMi/ICi00CZRgqhszzswLeCOS29Ija
         35WaD2Jt4eqUC/gYsQyt4jJSwMjSb9TtcdiwtgLjL9YmIOOua9POEcxtcL3lH6W2gzzw
         LBjcQ8TAEw7j3sECaVOacF+GKd0+M7kegOQwoQYKpJD98RQeYFC0yxIbP7Qank93Kr4a
         Oe5w==
X-Gm-Message-State: AOAM5332aB7eALvo4WfJ5QDptch87MliOSNdgKLmz36VFBDlQ1wjDUmA
	5PUW23j+f77JsnYbEEgmGxImdA==
X-Google-Smtp-Source: ABdhPJwcnM8i8qdcn5j8nc2/untmec0q/09+OwtcLFpgmEALpokbTjwiog2d6kLoQbJnoSm12t+t5w==
X-Received: by 2002:a1c:2342:: with SMTP id j63mr4886852wmj.109.1619192965059;
        Fri, 23 Apr 2021 08:49:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9e5d:1acf:2dd2:29e6? ([2001:8b0:aba:5f3c:9e5d:1acf:2dd2:29e6])
        by smtp.gmail.com with ESMTPSA id s16sm11174173wmh.11.2021.04.23.08.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 08:49:24 -0700 (PDT)
Message-ID: <6cbe3c2d2768bd9856f4f82a21b3d358b85b3944.camel@linuxfoundation.org>
Subject: Re: [master] Pull request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Fri, 23 Apr 2021 16:49:24 +0100
In-Reply-To: <b479f7b2-df5b-0ebb-1a64-75ecd1dcdde2@bootlin.com>
References: <b479f7b2-df5b-0ebb-1a64-75ecd1dcdde2@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-04-23 at 17:33 +0200, Michael Opdenacker wrote:
> Hi Richard,
> 
> The following changes since commit bed221137de77340280d71b4a8b0f2f60addc566:
> 
>   Adding dunfell 3.1.7 to the switcher and release list. (2021-04-21
> 16:09:17 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.yoctoproject.org/yocto-docs master-next
>   http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next
> 
> for you to fetch changes up to cefd66301a40f9048499879674e467543f704c44:
> 
>   ref-manual/variables.rst: Add incompatibility warning for
> SERIAL_CONSOLES_CHECK (2021-04-23 17:26:15 +0200)
> 
> ----------------------------------------------------------------
> Michael Opdenacker (3):
>       dev-manual: fix code insertion
>       manuals: simplify code insertion
>       manuals: code insertion simplification over two lines
> 
> Trevor Gamblin (1):
>       ref-manual/variables.rst: Add incompatibility warning for
> SERIAL_CONSOLES_CHECK

Merged, thanks.

Cheers,

Richard

