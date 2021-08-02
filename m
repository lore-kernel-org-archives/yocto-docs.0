Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.20989.1627916383060037936
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 07:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fW1q4X4a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id l18so21822295wrv.5
        for <docs@lists.yoctoproject.org>; Mon, 02 Aug 2021 07:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=/eJ0VIdTTyf1pbka6BkyZtiAQ253uSAkMvNWbqZGh8c=;
        b=fW1q4X4amtpTlPNbaX7bAJdKQH9dJrJnbRfiDM0bYgDeIWr0lClmMW5gcrqWIe4t98
         4CzbpbR+dizz5jXpUhTqK84liiOtT5dPNGZA1l/7/CXuqtFX2pLU/yJovNk0xZcMshrB
         USrCewrSFaAuVL4nDV1+RF+L5PlpSx9n/hd2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/eJ0VIdTTyf1pbka6BkyZtiAQ253uSAkMvNWbqZGh8c=;
        b=D2riUSZRJgV7DxShYZEvt3fE+9s6Sx8rZk3YMOxLiHLJosAiHc1JzsGc3pDmqTO1cx
         RaW33b8K6RhKZbbpjpWiYd4SiMI+MsO0FxiuJHnjUJhBv61pGfWMLGq+OxHjc3V0UZ9S
         Cbtbljj6+b6B1YxUs2tP9dLprCIzBBCfHH7ntqZV6VKiF8YrmsJolXMSK0t6yIRspuW+
         PRgjdKwUNqp4hGWMbTVNAJWL7D211LEWZ0JbPa9pqTLXck4LcbzvGTy1JG7T4cV2GPLB
         6sDcPICD+N5I6LDMz7iymsm/Yx5Bw1a1a6rcQQajlMcvyJcsI1ge36S4n1Pzr6Nbbh6y
         5CmA==
X-Gm-Message-State: AOAM530MuFHVRFzoMdpuMQ2+msX8+u3da0Aq+qvKeAvh7x/kQr+ghMYO
	tfPdL1Sn60czPgzE86KJ0OOiAA==
X-Google-Smtp-Source: ABdhPJzWRXferDNxXf3xAdUL491RcqWFIWPQB0XCG1n7BSWgFG71C5I1J5bbtwLhB17rp4jRuAYLDQ==
X-Received: by 2002:a05:6000:1b02:: with SMTP id f2mr17872540wrz.274.1627916381324;
        Mon, 02 Aug 2021 07:59:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9aac:cd42:2ef7:1a7c? ([2001:8b0:aba:5f3c:9aac:cd42:2ef7:1a7c])
        by smtp.gmail.com with ESMTPSA id 140sm10714440wmb.43.2021.08.02.07.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 07:59:41 -0700 (PDT)
Message-ID: <9533e7557ba1e4c64e6e03e906abb939e9e0ab63.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] manuals: initial documentation for CVE management
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, Quentin Schulz
	 <quentin.schulz@theobroma-systems.com>
Cc: docs@lists.yoctoproject.org
Date: Mon, 02 Aug 2021 15:59:37 +0100
In-Reply-To: <bce5cfa0-9a3e-d5a0-b1e6-ef0482e001db@bootlin.com>
References: <20210730185433.188851-1-michael.opdenacker@bootlin.com>
	 <20210802093618.npbsjvxyh7x3pbtl@fedora>
	 <bce5cfa0-9a3e-d5a0-b1e6-ef0482e001db@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-08-02 at 16:49 +0200, Michael Opdenacker wrote:
> > What about:
> > 
> > The CVE database is stored in :term:`DL_DIR` and can be inspected using
> > ``sqlite3`` command as follows:
> > 
> > [...]
> > 
> > ?
> 
> This sounds good to me. The initial text was written by Richard and I
> admit I didn't pay enough attention to this detail. Richard, would this
> be OK?
> > 

Yes, I was just dumping data into the bug whilst I had the context in my
mind/terminal :)

Cheers,

Richard

