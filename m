Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web08.22017.1605694038055021194
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 02:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nVBgI3iS;
 spf=pass (domain: konsulko.com, ip: 209.85.221.65, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f65.google.com with SMTP id l1so1547267wrb.9
        for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2020 02:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JQk7ZjxV+b0BjKsmeYao9+U+U8OoR457/eFOrWJlsiw=;
        b=nVBgI3iSvDj3Zwaiu4wjPGOo8b4imHVMPd3a/UGuC020/T+0o8qO1Ac704GZd/a1Yr
         HQanWQZqRpBMLWxXBHRyWAMlr9oa2g/1KXmjCMv8XjK1audKEowNnRCwJxe4ablN5nj/
         NF+ZBA/BmXG44qUJUCmr0JxNfmr0zwm3QbUSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JQk7ZjxV+b0BjKsmeYao9+U+U8OoR457/eFOrWJlsiw=;
        b=N20yZmJ+CYTffu7SqJktF+29ywkcvv7bfZ0eTArDD/RrMvkKj9j/AsNmfKNrltATT+
         ZqBOAWPJ+g/o7raeGA07C8QkXdtgGWW6bG557EivFGzt7yGH3c6ijvRu1Ad4ar36mno2
         AkX7ho5JvwSTZlx0uCahP2m119lx8md+Ah4f32rrgp6Ru2tEk86QRoft4fW+EhMlGBgD
         xI+JmbJ5R2V6hj4QTNa1Vi6drUhv6VxtwxgOFr6AaAjptPKPb7iRHmsPV2TsDaCylhd8
         674UqA+Jve1Bu2EV45KnD1NFR3rrU/PyOJU90vS5Yau0uCT1GKSXWqv8C+kq7dPya/mR
         FhsQ==
X-Gm-Message-State: AOAM533VbE8d4QLxrh5OCy2aM9ezGcZd2U8sJ9D+NMoFbxukrjjO2iJw
	A3nW+Ir88Tr5XrsgGAwljt2nKG/06S2kPQ==
X-Google-Smtp-Source: ABdhPJzDr1RMyyWipOJkVDzg2qyVpR5erCxY12PN0EHpM+qd9KqdM1wPIkjXVyNpyPbC1E1XHUp7ZA==
X-Received: by 2002:adf:f549:: with SMTP id j9mr4108187wrp.324.1605694036439;
        Wed, 18 Nov 2020 02:07:16 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id a128sm3013391wmf.5.2020.11.18.02.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 02:07:15 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 9/9] documentation/README: Refer to top-level README for contributions
Date: Wed, 18 Nov 2020 10:07:05 +0000
Message-Id: <20201118100705.3656-9-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201118100705.3656-1-pbarker@konsulko.com>
References: <20201118100705.3656-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This may help anyone looking for patch contribution guidelines in the
documentation directory itself.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 documentation/README | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/README b/documentation/README
index 28d5c4be8..b0a3cb1dc 100644
--- a/documentation/README
+++ b/documentation/README
@@ -325,3 +325,9 @@ References to the bitbake manual can be done like this:
   See the ":ref:`-D <bitbake:bitbake-user-manual/bitbake-user-manual-intro:usage and syntax>`" option
 or
   :term:`bitbake:BB_NUMBER_PARSE_THREADS`
+
+Submitting documentation changes
+================================
+
+Please see the top level README file in this repository for details of where
+to send patches.
-- 
2.20.1

