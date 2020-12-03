Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web09.4241.1607031803616550829
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 13:43:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LU8elHqu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id i2so3385697wrs.4
        for <docs@lists.yoctoproject.org>; Thu, 03 Dec 2020 13:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=HEqvxc0G44sbmMgpae2iQO5IkiNYaMIzO7odo6VGj0w=;
        b=LU8elHquAPI2/1bZ/jutHveDPqByoa4EguHCSo9JTBoKKw7a4DHyC+kJfBJ1dOutzQ
         1JNnDAwvNcLhsQbCN0R03ycAKWb4TLRYSyrOXQFk0GMyqvsvd10px028Fx378jgwSnUe
         v1493ciPZZv5vbIxJFOYKk8LUavW7kID8swd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HEqvxc0G44sbmMgpae2iQO5IkiNYaMIzO7odo6VGj0w=;
        b=Idi0uL0dCGhjjU+UIF5N5WP2ahaTBgOnuWuKe1AC4kXQpAXfuRtIZq5/woE9OyLkHH
         o8lSYx09oX8xJHPmcRfshk+5mTZa1eTrRH6QyYf8VHPbZcXA8MCtaQnQeIDWThe/ogWR
         84txiGHWoB5TAAx5/wmZyAlUJYWl8liLn3eU2/StMVqxHbMxwNhMEpmvk7HlhiL/jiA0
         DQBKj2pfRPZZd/EH5H0UxzwNBmhz+IbglWX3rpqNBruHnYSAu5RvHSQtYibwuzonl15f
         dqN3XpBIf9aqYgqgiaWtlUQ+6HqeQlvzBUNDT9rUVs1n0PzkkwhjbOLL9dqw/Dm0d6HX
         Oyfg==
X-Gm-Message-State: AOAM530EcEBvN2XlK4/AALxSKyRj9S2VUZB8HE4qJScc5jUSNbd0ZKN4
	UNLWMR84entzC/gckIqfPA5kag==
X-Google-Smtp-Source: ABdhPJyZkIe95BXV27ICoifZXikTLlghvuAt7F10Ydu2AjKuSC3n1NiOdljxotl5IAvTAs7ugNlFRw==
X-Received: by 2002:adf:f944:: with SMTP id q4mr1350244wrr.120.1607031802283;
        Thu, 03 Dec 2020 13:43:22 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.2.d.8.e.2.1.e.1.8.2.c.7.a.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.2.d.8.e.2.1.e.1.8.2.c.7.a.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c4a7:c281:e12e:8d29])
        by smtp.gmail.com with ESMTPSA id b4sm899333wrr.30.2020.12.03.13.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 13:43:21 -0800 (PST)
Message-ID: <d0b92a768d8e231407eb9bd78c0c43baa161f8d8.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] releases: conf: add link to 3.1.4, update to include 3.1.4
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, Michael Halstead
	 <mhalstead@linuxfoundation.org>, docs@lists.yoctoproject.org
Cc: rpurdie@linuxfoundation.org, nicolas.dechesne@linaro.org
Date: Thu, 03 Dec 2020 21:43:19 +0000
In-Reply-To: <a9242731-e044-c649-ac05-4b18ee33f011@gmail.com>
References: <20201202220453.33336-1-mhalstead@linuxfoundation.org>
	 <a9242731-e044-c649-ac05-4b18ee33f011@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-12-03 at 13:40 -0800, akuster808 wrote:
> IMHO, I believe the branch maintainer should take up this task.
> 
> Should update process page if not already noted.

I'm a little torn on this since the final step is part of the
"publication" of the release and the CI system does live deployment...

Cheers,

Richard

