Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.15535.1604945552033228801
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 10:12:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uWlMdX7E;
 spf=pass (domain: linaro.org, ip: 209.85.219.177, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f177.google.com with SMTP id 10so5556803ybx.9
        for <docs@lists.yoctoproject.org>; Mon, 09 Nov 2020 10:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=fly2z0HaBP/tVpqEMTtt9Dnmgp2lRFPfazAYAXekBPg=;
        b=uWlMdX7E3/B63aixV/RQbslwQVhh9ez5EvRxyZBfSDz0JE4SQRocpwWwCXfh0E+Lrg
         w6XgbLVPNOwZLOdsdbsHx4P5tO3rPKzzuJ/kdZNBYCQZp0kmTaVDbIszy+60yL5IY5JX
         R4F10WczthyfATtDUCzsibrbZhD8YurpO97vg5X7Wg3ubR1S3aLEIk762b+RBCEHf47U
         NZF91E4eIOL/NPtD7YVT+PQZBLBM4cWeW3pXBHofOuo5mf/8I6gvUKHqw58MVnp1R3hD
         A5klyv3rxqaCAcHBIdQ11O7xJFWrwyS16odFp8uJtJNyYvKETC/c86LHMrwzQlAPOLAl
         gQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=fly2z0HaBP/tVpqEMTtt9Dnmgp2lRFPfazAYAXekBPg=;
        b=UbBJ30MZHSuskORFPVnajQz+LPr3ZauCgVma8D/o2+ao7vZLK6MLLVPCjGZOdye9nY
         3mTU8o3y3gRAI6WklON7qh50FQg0LcJFRLY3RfX/xvhjbQHuZjrJ67g8PA9vNA8fGN0P
         iWnXd1za2ylLy9XNrV7BUeJZ1N+fk1Cju7kUoJ++p5uTDMfaqK7y2rsL+4vPHQqghKfl
         Gif0S3GjrOO33e1BdnNCGEVXjHrqhsLyhk+A8rlM5z/zwNv3/f52hNwyAaGAMW3Y7U6k
         rHKlK6WjSVxkZAOBjaehPcQKNauekddoaQj8raYCwQ7hB7TFybxgTlCFtIWwHL5zTIgl
         VH9A==
X-Gm-Message-State: AOAM530d+K4Siiw6r55o9ARtvdIBwG/APZNet5AHz33EU1sObKz0YMte
	Zoqk2Oo03uMKd0ZCsFPrZXT1+J52FWonGcki4rI+3UAc6m+bUqvs
X-Google-Smtp-Source: ABdhPJyFG75orOOqqu73UD7xbbiyfMu+hXDREnC5qaXm1RdVVqcw6UMKGQjh2ZC9Yn9JibhpsOdZAO5BhEhnWz9C4Ho=
X-Received: by 2002:a25:6e8b:: with SMTP id j133mr20936653ybc.273.1604945550907;
 Mon, 09 Nov 2020 10:12:30 -0800 (PST)
MIME-Version: 1.0
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 9 Nov 2020 19:12:20 +0100
Message-ID: <CAP71Wjztx0OTgNou4L44LfFqbE3tReGeM3=N6=1CPO464bH6Ww@mail.gmail.com>
Subject: CI/CD for YP and bitbake docs
To: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

hi there,

I wanted to let everyone know what we have put in place some CI/CD to
deploy docs onto our new docs.yoctoproject.org website. And we are
doing it with the YP autobuilder, of course ;)

The autobuilder job can be found here:
https://autobuilder.yoctoproject.org/typhoon/#/builders/114

We are deploying several 'versions' of the docs:
* 'master' is published to https://docs.yoctoproject.org/.
* 'gatesgarth' to https://docs.yoctoproject.org/gatesgarth/
* 'master-next' to https://docs.yoctoproject.org/next/
* each 'tag/release' is published to https://docs.yoctoproject.org/<VERSION>

Similarly, for bitbake, we have:
* https://docs.yoctoproject.org/bitbake/
* https://docs.yoctoproject.org/bitbake/1.48
* https://docs.yoctoproject.org/bitbake/next/

There are more details on this bug report, if you are curious:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14114

The whole deployment is now done automatically (for all branches, not
tags/releases), and this should be a great benefit for all of us.

We are still working on polishing some details.. but I wanted to bring
that to your attention, in case you notice any new issues. In which
case, please report them here, or on Bugzilla!

Many thanks to Richard for working out the AB magic..

cheers
nico
