Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.7083.1619875709286012148
 for <docs@lists.yoctoproject.org>;
 Sat, 01 May 2021 06:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ibX0NhDK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id m9so886115wrx.3
        for <docs@lists.yoctoproject.org>; Sat, 01 May 2021 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=TbqM8D26p6XHMY7vsD9BI/iWsobQ9kJi7c4RWYhL93Q=;
        b=ibX0NhDK61dfOrz/DoIstMh2To2SQxDV3SgzFrP0eKFs5JYZjiozR9lBLoR1Iu8dCQ
         +RS7iyDlV7qebBBfCAv/we55Tr27Lh2vN711Xc2aSvylO++d3dxoyz7ghrXTIJH2iv+4
         7K5vpbmifWZ1AygZRA99CYkdIsVSVWj399ROs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=TbqM8D26p6XHMY7vsD9BI/iWsobQ9kJi7c4RWYhL93Q=;
        b=kB/4Z8BQJVkD5yMBEiWBZHGUzcTlgOcY875w2DlT7w0qbhAQIrmxm/f0JHf/OXdneQ
         fBiuJ06zAwkxd0msa9kv1gDYuWMbU1XYPfsSSN2p1xH8cVKqSAWvogvsaSzQJUImK0p4
         ZyauVsfC5VCnQWnCrc7hQR/LjYYI2oCLAXfSZ5FKuCCkRxfxNkR7A5S+vbYYtQjklB+r
         WR5uwksscpbjwS23BhdFDY4zTyqa8Kx4P58S6DdzbF/9yEyvKXBRexupvHwDcQRkKgna
         gXNWIACRdBJnK3F+YIOeN46gVDO00QpUp9GrbRqSacjbhtdRONJLwuN89ihR8EFB7myp
         LNsQ==
X-Gm-Message-State: AOAM531Z4+gKYxCOLAJmUjb7FiPu+XLO51a/WTmqtH6hJVEkbLgLwtya
	87iZ9AD19e7qAKt6YK4BCnPmLc7lehv2xg==
X-Google-Smtp-Source: ABdhPJxHOVrqSJvH9/JCCSjeJLLu5mwkxo0GC52dpcgt9wY+QjHc3maYZ+itZ+Jb8X+tnGIu+OPNow==
X-Received: by 2002:a5d:4c8a:: with SMTP id z10mr14195595wrs.395.1619875707879;
        Sat, 01 May 2021 06:28:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:eb8b:7645:cc71:2e2a? ([2001:8b0:aba:5f3c:eb8b:7645:cc71:2e2a])
        by smtp.gmail.com with ESMTPSA id y16sm6091741wrp.78.2021.05.01.06.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 06:28:27 -0700 (PDT)
Message-ID: <9ac2c7e224812c9709b6cfeb8ffe54a614619466.camel@linuxfoundation.org>
Subject: Re: [docs] purpose of /tmp/work-shared?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Sat, 01 May 2021 14:28:25 +0100
In-Reply-To: <1bef6f43-8b4b-468d-1f90-116f5cf4221@crashcourse.ca>
References: <1bef6f43-8b4b-468d-1f90-116f5cf4221@crashcourse.ca>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2021-05-01 at 08:59 -0400, Robert P. J. Day wrote:
> from:
> 
> https://docs.yoctoproject.org/ref-manual/structure.html#build-tmp-work-shared
> 
> "For efficiency, the OpenEmbedded build system creates and uses this
> directory to hold recipes that share a work directory with other
> recipes. In practice, this is only used for gcc and its variants (e.g.
> gcc-cross, libgcc, gcc-runtime, and so forth)."
> 
>   but some shared kernel content is also still stashed under there,
> no? should that not be mentioned here? or have things changed?

We changed the kernel to use the shared directory too, the docs obviously
weren't updated.

Cheers,

Richard

