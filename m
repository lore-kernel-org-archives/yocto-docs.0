Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.11832.1586945969726078679
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Apr 2020 03:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FxfXjy8S;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id u13so17958579wrp.3
        for <docs@lists.yoctoproject.org>; Wed, 15 Apr 2020 03:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=0SeKGUb3+vN8+PLL0OEy7TlwGf2YiXtDp5nU5BNMqFM=;
        b=FxfXjy8SVZBhU+gtwZ9Td8MjUtRiqJN4UfaHKttS+OiKrDf5q+/TgZ7VjIUkODk4Y2
         ksq47a4bRQyk6zTl3+W5OFw+0XzJBSbPPrRrnlFb9UxmElUNruUnECDANUyD1COvk5JM
         niCIB5FJHa89+5fg3WQlfNAaUDoMwNxNgFG+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=0SeKGUb3+vN8+PLL0OEy7TlwGf2YiXtDp5nU5BNMqFM=;
        b=Jzd2VMXWkm3AqjIbD9i60AhZwd/+gyR4bNtyaD6I6T1CGuLWnWm5+ngmaoVZdGr1xN
         2wsrUJYI6AkqeE0Ji7MJy/QaCwN96K3K4dGZn0E91SNcF75E4sEkvXCvrlGjDBWuxlnN
         TOZLfCvddoeTmYbAYpnfR959ksysVVe8pSvNBfzQahRDNqmwgXmdzRhX/GOyb35tgCOf
         YBBgmMn96BtTHLJsxC7CQajMjwdDcJpqG8h1gnJteD2AFgrks1TT+hTEsC8uQ0oKaBgi
         PAfURRoECXu32Xc1eZUx8+sInMqs7AKKrHCyvEAQH74gHTbS7tW2vRvmy6Ysjm85X4PP
         XG0A==
X-Gm-Message-State: AGi0PuZzf/IIJwtO3BAKrS6b8IAT/vh8Sy6qe8S9WSBxGSsVk+knTXbr
	goWI9AJNng73JmDePRiqZFV0pnBa2A8=
X-Google-Smtp-Source: APiQypIPdrSMJIezkZ7GaZNDRmdYJmiNdeOlejhjNGu8mQ9YJJ7PuuM9EWuuYLLBzX22LuHvLmGKGA==
X-Received: by 2002:a5d:410a:: with SMTP id l10mr27881444wrp.355.1586945967818;
        Wed, 15 Apr 2020 03:19:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a67sm23370881wmc.30.2020.04.15.03.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 03:19:27 -0700 (PDT)
Message-ID: <135fccacd4ee8a1ffe0e06f6f95c22e05dadf04a.camel@linuxfoundation.org>
Subject: Possible changes to the project docs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 15 Apr 2020 11:19:25 +0100
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Since Robert was talking about future docs wide changes, I wanted to
put an idea out there. Its something a few of us have talked a little
about. At this point it is an idea, not a decision and something we're
thinking we need to explore and evaluate.

Basically, the thought is whether to move from docbook to sphinx.

Other projects like the kernel have switched and it could assist some
of our website/publishing challenges. It might also be easier for
people to contribute to and there are wider and more modern tools
supporting that format.

It'd be a big change, particularly if we consider we may need to
convert previous releases of the docs as well as the current version.
That said, if we were going to do this, the time could be now...

Cheers,

Richard





