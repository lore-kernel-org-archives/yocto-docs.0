Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.353.1583362413311696376
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Mar 2020 14:53:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S7TrgIEG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id h9so4577117wrr.10
        for <docs@lists.yoctoproject.org>; Wed, 04 Mar 2020 14:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=aYXbfTT62qbvDv/Ml+JFA/VuQ9c6kZjNbwYRMm9WJ+Y=;
        b=S7TrgIEG9+oXQtFA5MdBh+gJ6P3qnjsdwxx9mbq8hqShq7TFZjpmCWQtDfcaATCInw
         NQOHVVlHH5HgLhYF50KRS9+9htgEY1LWjn5Cyf9qyNVS7lZYlzwhLDRnrW47QMs+H/lm
         t6aIc8t5Op9wahvrqRsA5UOtM2pkBX/jmAf/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=aYXbfTT62qbvDv/Ml+JFA/VuQ9c6kZjNbwYRMm9WJ+Y=;
        b=f5uIggrt7ghT2Xr+cFWcWV8M+QhH/uWu3llHinmK/pq9mczXgFtEX3oZdpKqkNpAH/
         9H0Ld4gvfpS+0nE5gMbDqFXTNIet24SL58qKbWbOxooG8HeM+ulM1gPROgl50fLIvxMK
         ieSbzmapHl9E4nbsbAneMFzar9jfD8imIk51PGO86uQlsik67QZ8bkxd/M6jRmQ+4Yjb
         lCOsINN8YC/ZdojallaP/mlYRq6uXAHmuvNM2+hgUp7tPMyVp8PIjc/lkHRHNKDFuwjm
         PosPk+lUXnUOwQDtj3Uy8/wKBEnsreeOaC0uVUMIuJCJN15CHCGSwYoe+3xTZqOyAnlt
         A/pg==
X-Gm-Message-State: ANhLgQ3IbAcQQ8UMTsOY/cI7RXVbvDDa6Iw3qQh+HUujU1/3cGf8Ke1+
	1Z0e9lfK5L6yXSHz80SC2iew+SYFvq8=
X-Google-Smtp-Source: ADFU+vuX9++hgb4x/Pm87sKTUtqdL+dm7KXp3wW8Y2iVzDSpFP1paMtGXqBCKIfRq7i+4i53fJ+Lbg==
X-Received: by 2002:a5d:5401:: with SMTP id g1mr6114323wrv.414.1583362411436;
        Wed, 04 Mar 2020 14:53:31 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a26sm6566932wmm.18.2020.03.04.14.53.30
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 14:53:30 -0800 (PST)
Message-ID: <8355cd28f9ba8e03e4e2c29cbee17cbf9a053313.camel@linuxfoundation.org>
Subject: Re: [docs] update "Notes" in each manual to refer to this mailing list?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Date: Wed, 04 Mar 2020 22:53:29 +0000
In-Reply-To: <alpine.LFD.2.21.2003041751070.10876@localhost.localdomain>
References: <alpine.LFD.2.21.2003041751070.10876@localhost.localdomain>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-03-04 at 17:52 -0500, rpjday@crashcourse.ca wrote:
>   all of the current YP guides, in their opening, contain the line:
> 
> "To report any inaccuracies or problems with this manual, send an
> email to the Yocto Project discussion group at yocto@yoctoproject.com
> or log into the freenode #yocto channel."
> 
> should that be updated to refer to this docs mailing list?

Yes, it should.

Cheers,

Richard

