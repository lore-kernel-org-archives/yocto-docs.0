Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web09.13709.1611074529370403785
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Jan 2021 08:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iebPv99M;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 9so21826133oiq.3
        for <docs@lists.yoctoproject.org>; Tue, 19 Jan 2021 08:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BP3fUUPsngmQO61IYAF8zt0AdP8qdUqopJDczxj8fzA=;
        b=iebPv99MuFJVW3tWnsTgMHU6/yhZnmwYGOc0p/K1/JcwVPYMSTozgUrURUlEHDMVZ0
         PYk/DDXY03UjJcTNabYQX4WTnX5Rg6O2qjLjOj8Xs8r+mYB5dBaEsRDiq/7TKMioSrlK
         pgvs88H2jqC4+Ty/OYyhbWjckQHTcs0E0SZtbE8IPfWEYp/AzG44W5kHmGenImRdj9tj
         34kPM3/LkkKVCF8M95mB5ieKD6V8fkfpibdgw3pCAdF2DNQgoS6EJEADFRjyb9gtffLX
         xOkJJXB3bfcUFibcRrtbkDZjb13rk1M2U18LZJ8vzRIckEEQE0Dd79fqKBdbznszFfut
         wsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BP3fUUPsngmQO61IYAF8zt0AdP8qdUqopJDczxj8fzA=;
        b=bzTsBf/LRW2PbfeT45L+p3Sn8SBjEp5owAN9VOWqlWG1vn14U/eQ+Yp+hG68uT0mG7
         dHTzCb1PzSg/7CyVgYqmvZenEN2DkMq7XaJwSTayyfrILYYbX79jAm9wakmEaa12QcRa
         E5aI4gX2WZEL6LsjG9ILtAwLL7Xp/PCo5Hw0gA/S0IE9QGWdU1QuUVOoASBMyWHyH7p8
         JphIbW5eVZGe0l4wj8FS4sw+2k6icqeUfNKNArX6tM4gSqNyWueIQNBLfrrr72P7ts1M
         Rj6OAQsryEZTX1Xu8eTLSe/QhKFVQIU9kl2i5lgouLQuzKyDRo43EQF7kzgfzDS5rgK8
         LDNQ==
X-Gm-Message-State: AOAM5302Bg30b8GSecospislmNEVYn7SqeJOtbyIw9ua5/Uwx5KAXsEg
	osTkSk/tLYOh38cmH8ARW+XEYbi4kaw=
X-Google-Smtp-Source: ABdhPJwj0IS9gQtR0cydi7n44V4R+LTtJBGUAVK5SZA13yP3tcHlpm0iRq+YSE6JgKBgN42Cd1pcEA==
X-Received: by 2002:aca:4a15:: with SMTP id x21mr345855oia.116.1611074528456;
        Tue, 19 Jan 2021 08:42:08 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id j8sm1482654oie.47.2021.01.19.08.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 08:42:07 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: docs@lists.yoctoproject.org
Cc: quentin.schulz@streamunlimited.com,
	richard.purdie@linuxfoundation.org,
	rpjday@crashcourse.ca,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [docs][PATCH v2] ref-manual: Clarify recommended operator for PROVIDES
Date: Tue, 19 Jan 2021 10:42:00 -0600
Message-Id: <20210119164200.16690-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119155751.11243-1-JPEWhacker@gmail.com>
References: <20210119155751.11243-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updates the documentation for PROVIDES so that it recommends "+="
instead of "=".

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 documentation/ref-manual/variables.rst | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 4ce264813..1bbc5cbca 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5915,23 +5915,16 @@ system and gives an overview of their function and contents.
       file ``eudev_3.2.9.bb``:
       ::
 
-         PROVIDES = "udev"
+         PROVIDES += "udev"
 
       The ``PROVIDES`` statement
       results in the "eudev" recipe also being available as simply "udev".
 
       .. note::
 
-         Given that a recipe's own recipe name is already implicitly in its
-         own PROVIDES list, it is unnecessary to add aliases with the "+=" operator;
-         using a simple assignment will be sufficient. In other words,
-         while you could write:
-         ::
-
-                 PROVIDES += "udev"
-
-
-         in the above, the "+=" is overkill and unnecessary.
+         A recipe's own recipe name (:term:`PN`) is always implicitly prepended
+         to `PROVIDES`, so while using "+=" in the above example may not be
+         strictly necessary it is recommended to avoid confusion.
 
       In addition to providing recipes under alternate names, the
       ``PROVIDES`` mechanism is also used to implement virtual targets. A
-- 
2.30.0

