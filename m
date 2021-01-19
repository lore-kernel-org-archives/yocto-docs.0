Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.12716.1611070034070444889
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Jan 2021 07:27:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CsOsNHAu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id c128so124023wme.2
        for <docs@lists.yoctoproject.org>; Tue, 19 Jan 2021 07:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=SDH5yD+tbLJk0UBHxTg4rrNOmmMQV0qrlmEaB3mZHFg=;
        b=CsOsNHAusoCGMaDDaAGWN85nriAxJFdaeXwtvbP6qfyTfdew7r5an1Se18NB8oNe64
         SutOF8Qj5gx/XfqPX1GPE2ZIUewSi186hzadZ4ha5Te7eQeWz6iC7vrY4Q1ptKPa99hL
         nLPnCDUGlu5cVCtQT2YEBy/rEO8rLKoyp8d5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=SDH5yD+tbLJk0UBHxTg4rrNOmmMQV0qrlmEaB3mZHFg=;
        b=iMnRq6qO+DRH40mx5+k/1VNZ+NUbUrdQ2Q88pjaBnEVURB1j7fUeBYnK3Ms6uSUnhN
         sWUkDYeTPpXb+0QJ1NelXSiEyJMIoAE+TbGwzYactKdcDtkXxYlrz4bbTkXKW2r76Sgv
         R73rGjzKRP5jcC0COHViwsrNHtF3CYQVatPRzGJF8QOhrvIv3P2jLI75ZCTz9l5gl7l6
         Tbolyqk1JaI//aMKeHkYgGWVIKg8xTSGRVJiDh2rjF9lo7hWG471611eHmuJTMW6kwI+
         Ncj84SO8I3BN/cH4zBww8PjFVloaHldK97ELiMrhQKIRrzpnhIE/Z47BJbO8ddQiYCPG
         +rlA==
X-Gm-Message-State: AOAM5319um2YcMBNcBh4qUddYP9Euf0uI58iOWRz6H/x4MLH/akIW/9R
	cKmmu0v5L2vT98/Ggsop51QXrhv3fs/Zjw==
X-Google-Smtp-Source: ABdhPJw4OjTgl3n0qtoA6FcZ1wwzgJNwcmqroLcvfISBwbIplcDCKYOVEEsZJOho24F6t6FqpYdCjQ==
X-Received: by 2002:a05:600c:258:: with SMTP id 24mr130333wmj.161.1611070032560;
        Tue, 19 Jan 2021 07:27:12 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f7a4:851a:48d5:440b? ([2001:8b0:aba:5f3c:f7a4:851a:48d5:440b])
        by smtp.gmail.com with ESMTPSA id s4sm4704067wme.38.2021.01.19.07.27.12
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 07:27:12 -0800 (PST)
Message-ID: <de6c282b93e701bbd5d8b8bd1da6125c1cb6d38c.camel@linuxfoundation.org>
Subject: PROVIDES inconsistency
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs <docs@lists.yoctoproject.org>
Date: Tue, 19 Jan 2021 15:27:11 +0000
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On irc it was pointed out we have an inconsistency in the documentation of PROVIDES:

https://docs.yoctoproject.org/ref-manual/ref-variables.html#term-PROVIDES

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-PROVIDES

One says don't use +=, the other uses it as an example.

We should probably decide on which and clarify the manual.

In many ways I prefer encouraging users to use "+=" rather than setting
plain "=".

Thoughts/patches from anyone?

Cheers,

Richard





