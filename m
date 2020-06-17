Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web12.2380.1592426701911381168
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 13:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hv30VjBG;
 spf=pass (domain: linaro.org, ip: 209.85.219.181, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f181.google.com with SMTP id b15so1929765ybg.12
        for <docs@lists.yoctoproject.org>; Wed, 17 Jun 2020 13:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=rZ0HyEFVPKl/WDsyGXL4pTxsuMeqCyHnVzz6zNNOsOo=;
        b=hv30VjBGVsR2/ZHRFHPl4Y76SzlS5hZNxE7yxHVqUW0Vfqtex8CX6bzNWuentuBoiW
         UI/NgCUP2qqabaLfAl7kjLwIDo5sm1CrT9Cavi03T1T+eLeknztYxKMBhP8D+jIBY5nu
         ZISKm9nm5GkBbgJewDSR0z81XsPasoVeCU+bt0DCFSTpMEZD9i7UGMVl4++WFPwBqRjG
         fxK9gfbYI9oZqyG51jUXj6hgT+qb6Cvs3IaqHSn5kz9HOX7VLr/Ub7RLnfZ2C/tlFTqF
         jzNo3LriCN9zbX9JGfzyut1bupwwWi7HP7Mek6a6zTpv1bWz/fzPv0P7yrpM+YMq6Vfm
         lcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=rZ0HyEFVPKl/WDsyGXL4pTxsuMeqCyHnVzz6zNNOsOo=;
        b=iA1At4127J8RiXYbLIctfDCUEdF/VpLeGALjjXwF+cTkq0zcop11eK+yWLYtijc+af
         ayDnOcHDIpZUAjLe7qtNRCVEksSCuW/01hlHrZmRihmkrisU5CzGZwaonjpLXiOgkSXc
         8/5RZ/PK5kORGvwBLYYtUjSS7mRJFXNBHVDVzTu5uFDY3MZejWXkx2MS1NX58fMh/OdD
         HVHd6FmDog6sDkscMQUXvU02YBV4num2AipXp5IQ0KYPQGE3oyhsTJSThof+f8ixLu5q
         rl5COZxmpnqiYjIXuJ3rqcNP6VNrze20dW56r1U1QSzz53k8EFG/dE+hA9Xy0LSuPJFF
         ppTg==
X-Gm-Message-State: AOAM533By9mAvVGfQjc2D9gcuZCGNlk42le0PiYWuPph7In1D3XiUaBK
	ingjcE8T5IiwwyOeap6DkVOmT5Mr0/xxmgQdkiiVxFrEMWaK6g==
X-Google-Smtp-Source: ABdhPJy4dWi7eljGFRlIgkIxwbyQS5BfMyWXyOcIpAx1R5ndAWfg4ggevUAKuDSMMy1udyQNtLO3URsrPk3RUfq/JF8=
X-Received: by 2002:a25:b8b:: with SMTP id 133mr1221988ybl.373.1592426700644;
 Wed, 17 Jun 2020 13:45:00 -0700 (PDT)
MIME-Version: 1.0
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 17 Jun 2020 22:44:49 +0200
Message-ID: <CAP71WjxqcQOSuC4_Z0cnMY7AbPdA84AASx7PAYVhFr3kXVJxyQ@mail.gmail.com>
Subject: Migration to Sphinx
To: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

hi there,

I wanted to update everyone with the outcome of our meeting today.
Mark Morton, Richard and I attended and discussed the Sphinx
conversion.

Overall we've reached an agreement that this is probably the best
tradeoff, and we want to go ahead. Richard will talk to the TSC of
course, for a final round of approval.

Here is the proposed plan of actions:

1. we will start a 'sphinx' branch in yocto-docs and bitbake (bitbake
DocBook manual is hosted in bitbake tree). This will be a development
branch we can all use for the initial conversion. Once we are 'done'
with the content and that all the documentation is migrated from
Docbook to Sphinx, this will be merged in the respective master
branches.
Note that we might rebase/squash the 'sphinx' branches from time to time.
2. Patches for the 'sphinx' branches should be sent/reviewed on this
list with [sphinx] in the email subject.
3. Mark, Richard and myself will maintain this branch initially.
4. We will setup a script to generate and push the HTML content every
time the branch is updated
5. Mark will investigate how to create our custom CSS theme, and will
make a first implementation.
6. The doc changes between master and dunfell are fairly minimal right
now, so assuming this goes well and is ready for 3.2, we will most
likely backport the sphinx based documentation for 3.1 (but not
previous releases).
7. We intend to continue to provide our legendary mega manual (we all
have it opened at least once in our browser!).

For now we are using the following wiki page to track this activity:
https://wiki.yoctoproject.org/wiki/Documentation_Sphinx

If you have any feedback, please let us know. We expect to get started
in the next week or so.

cheers
nico
