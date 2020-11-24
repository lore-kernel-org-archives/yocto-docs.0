Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web09.48926.1606202401931639676
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 23:20:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vsqAr48Z;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id o144so18373703ybg.7
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 23:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5oF/RpMHC3HfKNI07hRiIp7z/j3LTqJe5nBxvq/+pGY=;
        b=vsqAr48ZNddTNP39TObnSRyhdGBfTFbQ8DWfYrMpJKipnd96Z5pbcEkxofrilIkPJm
         vaP2O+jFNJB33hiXKuaNa0WAQ5JWHiXYzDvOmLGLsAxv1qMluljaVAgqkHy4B764XwqJ
         X1rPDdUb3RbKAldMKiFuxdbRfZs/sZb/Kz9pBNVNYE06Yd7l7gyHYDtZ8WHfqsE3cyN/
         +2zLJtIMFo0YCDcL9EdIKxlBfdALvlRuxBMiWdytNUfhCjtJTwauF+yyJlnrCQ4JxzfH
         2ReyQtjfpH0ShiEHyp71wFeHpAEu7m75T840oiiDewFv55W2Q/xLp4glnRVZ3WAA9zFC
         4eKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5oF/RpMHC3HfKNI07hRiIp7z/j3LTqJe5nBxvq/+pGY=;
        b=EiB+sDu3jwzweO1R6A+H7VnjTaJ8AA1Xn9QPEbp3ATJlrAN+5Sd9dghU5h8X1wQbJ7
         mWNsm0bXgmyxgO13Jyg+g94UsSyagPVH17ttOOIOJ+iFEy7QCMTJuUbcDBDKjOldNRdn
         +3uT/cTYi7TxGdISsbwfQ1gqFOE1bYao9Q6fU9QMwWgVqY12vCOF8lPlZM8qIzo28nKn
         6Vv7w6MTlMJroZ76deO2yHhlYiYsrn8sH3521nFeAmvcLr/Etf8SnFiATInpVV8xuXuW
         WDSDIQfdIZ2r4J6yW/AL64nqo94AyY5FQopXWJZyKmTHjTG1cHDnqWJ3by4aEu4n01zo
         Izkg==
X-Gm-Message-State: AOAM532xMcM3uKyZjmDK6AY3hcwiVce8ErX9BzN7eoejU4ZOfdPYOB6w
	6SoIGvXamoGG5IRqTxfSoE+uDRSIyu2uDYvD2x/P2Q==
X-Google-Smtp-Source: ABdhPJxIAmqhRo45wIyvBIAf8jqydZJiTxoiPMT0yWzTJ7K63n+tT4pFpzgQweTwOigSOtwjqOGBbC7LbKdhK9xPWYM=
X-Received: by 2002:a25:287:: with SMTP id 129mr4761282ybc.454.1606202400987;
 Mon, 23 Nov 2020 23:20:00 -0800 (PST)
MIME-Version: 1.0
References: <20201123203245.2900-1-pbarker@konsulko.com>
In-Reply-To: <20201123203245.2900-1-pbarker@konsulko.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 24 Nov 2020 08:19:50 +0100
Message-ID: <CAP71WjzsEtkxaGprSCc7emQ=aqiNJAWcMzWRMRmQpSxfSc9SYw@mail.gmail.com>
Subject: Re: [docs] [PATCH] Drop old presentations from repository
To: Paul Barker <pbarker@konsulko.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2020 at 9:32 PM Paul Barker <pbarker@konsulko.com> wrote:
>
> The `presentations` directory contained two talks which are now over 7
> years old and are unlikely to be relevant to current users of the
> project. They don't fit in well with the rest of the contents of this
> repository and should be dropped. If anyone wants them, they'll still be
> stored in the git history :)
>
> Signed-off-by: Paul Barker <pbarker@konsulko.com>

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

> ---
>
>     I created this patch with the --no-binary argument to git-format-patch to
>     avoid sending megabytes of redundant data to the list. However that means
>     the patch doesn't apply as-is. The following steps work for me:
>
>         git am 0001-Drop-old-presentations-from-repository.patch
>         git rm -r presentations
>         git am --continue

You might want to post your patch in a branch for us to pull from.

>
>  .../automotive.pin                            | 369 ------------------
>  .../blueprint.jpg                             | Bin 693096 -> 0 bytes
>  .../automotive-linux-summit-2012/cables.jpg   | Bin 293433 -> 0 bytes
>  .../automotive-linux-summit-2012/cake.jpg     | Bin 445144 -> 0 bytes
>  .../automotive-linux-summit-2012/cars2.jpg    | Bin 396234 -> 0 bytes
>  .../automotive-linux-summit-2012/cat.jpg      | Bin 374719 -> 0 bytes
>  .../automotive-linux-summit-2012/chip.jpg     | Bin 96668 -> 0 bytes
>  .../automotive-linux-summit-2012/corridor.jpg | Bin 294956 -> 0 bytes
>  .../automotive-linux-summit-2012/cpus.jpg     | Bin 475614 -> 0 bytes
>  .../automotive-linux-summit-2012/dash.jpg     | Bin 131336 -> 0 bytes
>  .../automotive-linux-summit-2012/dolls.jpg    | Bin 237901 -> 0 bytes
>  .../automotive-linux-summit-2012/engineer.jpg | Bin 310702 -> 0 bytes
>  .../automotive-linux-summit-2012/group.jpg    | Bin 392570 -> 0 bytes
>  .../automotive-linux-summit-2012/hob.jpg      | Bin 561538 -> 0 bytes
>  .../automotive-linux-summit-2012/minifigs.jpg | Bin 497571 -> 0 bytes
>  .../automotive-linux-summit-2012/none.json    |  50 ---
>  .../automotive-linux-summit-2012/owl.jpg      | Bin 339288 -> 0 bytes
>  .../automotive-linux-summit-2012/people.jpg   | Bin 268848 -> 0 bytes
>  .../automotive-linux-summit-2012/qa.jpg       | Bin 167108 -> 0 bytes
>  .../automotive-linux-summit-2012/question.jpg | Bin 505072 -> 0 bytes
>  .../automotive-linux-summit-2012/road.jpg     | Bin 188611 -> 0 bytes
>  .../automotive-linux-summit-2012/tins.jpg     | Bin 501518 -> 0 bytes
>  .../automotive-linux-summit-2012/tools.jpg    | Bin 547380 -> 0 bytes
>  .../automotive-linux-summit-2012/tumble.jpg   | Bin 438564 -> 0 bytes
>  .../automotive-linux-summit-2012/umbrella.jpg | Bin 311845 -> 0 bytes
>  .../automotive-linux-summit-2012/xwing.jpg    | Bin 421747 -> 0 bytes
>  .../automotive-linux-summit-2012/yocto.jpg    | Bin 40098 -> 0 bytes
>  .../osts-2013-why-use-yocto/advert.jpg        | Bin 649120 -> 0 bytes
>  .../osts-2013-why-use-yocto/apple.jpg         | Bin 565059 -> 0 bytes
>  .../osts-2013-why-use-yocto/bike.jpg          | Bin 611684 -> 0 bytes
>  .../osts-2013-why-use-yocto/bomb.jpg          | Bin 82008 -> 0 bytes
>  .../osts-2013-why-use-yocto/cables.jpg        | Bin 293433 -> 0 bytes
>  .../osts-2013-why-use-yocto/clay.jpg          | Bin 66128 -> 0 bytes
>  .../osts-2013-why-use-yocto/data.jpg          | Bin 432108 -> 0 bytes
>  .../osts-2013-why-use-yocto/engineer.jpg      | Bin 310702 -> 0 bytes
>  .../osts-2013-why-use-yocto/labquest.jpg      | Bin 35381 -> 0 bytes
>  .../osts-2013-why-use-yocto/license.jpg       | Bin 236192 -> 0 bytes
>  .../osts-2013-why-use-yocto/minifigs.jpg      | Bin 497571 -> 0 bytes
>  presentations/osts-2013-why-use-yocto/qa.jpg  | Bin 167108 -> 0 bytes
>  .../osts-2013-why-use-yocto/road.jpg          | Bin 188611 -> 0 bytes
>  .../osts-2013-why-use-yocto/train.jpg         | Bin 399452 -> 0 bytes
>  presentations/osts-2013-why-use-yocto/tv.jpg  | Bin 392568 -> 0 bytes
>  .../osts-2013-why-use-yocto/xeon-phi.jpg      | Bin 158595 -> 0 bytes
>  .../osts-2013-why-use-yocto/yocto.jpg         | Bin 40098 -> 0 bytes
>  .../osts-2013-why-use-yocto/yocto.pin         | 254 ------------
>  45 files changed, 673 deletions(-)
>  delete mode 100644 presentations/automotive-linux-summit-2012/automotive.pin
>  delete mode 100644 presentations/automotive-linux-summit-2012/blueprint.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/cables.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/cake.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/cars2.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/cat.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/chip.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/corridor.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/cpus.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/dash.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/dolls.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/engineer.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/group.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/hob.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/minifigs.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/none.json
>  delete mode 100644 presentations/automotive-linux-summit-2012/owl.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/people.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/qa.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/question.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/road.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/tins.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/tools.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/tumble.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/umbrella.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/xwing.jpg
>  delete mode 100644 presentations/automotive-linux-summit-2012/yocto.jpg
>  delete mode 100644 presentations/osts-2013-why-use-yocto/advert.jpg
>  delete mode 100644 presentations/osts-2013-why-use-yocto/apple.jpg
>  delete mode 100644 presentations/osts-2013-why-use-yocto/bike.jpg
>  delete mode 100644 presentations/osts-2013-why-use-yocto/bomb.jpg
>  delete mode 100644 presentations/osts-2013-why-use-yocto/cables.jpg
>  delete mode 100644 presentations/osts-2013-why-use-yocto/clay.jpg
>  delete mode 100644 presentations/osts-2013-why-use-yocto/data.jpg
>  delete mode 100644 presentations/osts-2013-why-use-yocto/engineer.jpg
>  delete mode 100644 presentations/osts-2013-why-use-yocto/labquest.jpg
>  delete mode 100644 presentations/osts-2013-why-use-yocto/license.jpg
>  delete mode 100644 presentations/osts-2013-why-use-yocto/minifigs.jpg
>  delete mode 100644 presentations/osts-2013-why-use-yocto/qa.jpg
>  delete mode 100644 presentations/osts-2013-why-use-yocto/road.jpg
>  delete mode 100644 presentations/osts-2013-why-use-yocto/train.jpg
>  delete mode 100644 presentations/osts-2013-why-use-yocto/tv.jpg
>  delete mode 100644 presentations/osts-2013-why-use-yocto/xeon-phi.jpg
>  delete mode 100644 presentations/osts-2013-why-use-yocto/yocto.jpg
>  delete mode 100644 presentations/osts-2013-why-use-yocto/yocto.pin
