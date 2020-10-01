Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.73])
 by mx.groups.io with SMTP id smtpd.web10.8553.1601544535530235309
 for <docs@lists.yoctoproject.org>;
 Thu, 01 Oct 2020 02:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=c0LSNpEB;
 spf=pass (domain: arm.com, ip: 40.107.15.73, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4shwTQv0jBTFym1UkhOOBTFQJo+ESt0LLuhyL+uL3OI=;
 b=c0LSNpEBhHEJbFKf7WUe5Cb5GY/kJzViHcyvylaKAy9tmV8UNQALYkZlU7AMybEu0HF2lJP17YNn43hSgzJKinge9jjyaVmWjVOYZuD+r8TJjv2b4Z65GIYLoL4CyV7AzFgNUzVzDrXMv6klC2qB7iK1lHWJvMDT7P7qFwrm3Pg=
Received: from DB8PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:10:110::18)
 by AM6PR08MB4119.eurprd08.prod.outlook.com (2603:10a6:20b:ad::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Thu, 1 Oct
 2020 09:28:45 +0000
Received: from DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::6a) by DB8PR04CA0008.outlook.office365.com
 (2603:10a6:10:110::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24 via Frontend
 Transport; Thu, 1 Oct 2020 09:28:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT049.mail.protection.outlook.com (10.152.20.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Thu, 1 Oct 2020 09:28:45 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Thu, 01 Oct 2020 09:28:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 346dc0e064df8af1
X-CR-MTA-TID: 64aa7808
Received: from a69787d1d23e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E0E392B8-C7B3-4AED-A6F6-59FE50ABB44E.1;
	Thu, 01 Oct 2020 09:28:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a69787d1d23e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 01 Oct 2020 09:28:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4+8b6QrHPurQvA+DglhEUGvSVQufcYhVYQmaqN4JoLq/hz4xXaehhhdDv491rynFE3nccJwZr3hEEy00qQgByc+Iom8BjCzUlCsbFB2I4Y5Zb3Zd/BYcK4t+ragltoW3dArHCYJcuyde4XJ56m4E2m54pFucSbSiyNMy58TkV7zzokvCb4nZt3MV9SCKM940Vf0qxTbirUmPcjcC3ieMLIaHgDK7GwpNn+sQA5ULHPay8Lql0Vl8L2S5zrhWy4erck979+ecs3S0c5Gu6tlGSFXMbBGpoZtl7qV0DvoZGWuOogL9lcNXYOEuvtOVnMXF4HhwtSboECB9XD1/s5BZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4shwTQv0jBTFym1UkhOOBTFQJo+ESt0LLuhyL+uL3OI=;
 b=YwsPBgTewDTWy2U35x0U8j9mJiaqHe/jk5TgtbNFtxAneMRAeOp+jvXkBstII7CuYQKmpHAFXlDYS+qjLVV2e048jSihhZfOBxCIdPkZfRwfg4ZOkbnFpkDT3UsNgmL7JOlsO3Mgbkv7TT9ipADmTJ8PRk60g2kkvvd0HUQKIg4MJKyZlUO2/j3t55vBqYXtkJa6EqKrNc9mCSo3IUpTavGPhLqQTy6DHAdQFKAUY5m0bl9NkAoK6BN5PACSJmgeBIeGNCw6xwFzyLbO8yuWNxpjtQo65bsvlE5pkYPnFhQElAATX8YmLFT68jgcH8oanTnNSkNMznkOvr9VPnUG0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4shwTQv0jBTFym1UkhOOBTFQJo+ESt0LLuhyL+uL3OI=;
 b=c0LSNpEBhHEJbFKf7WUe5Cb5GY/kJzViHcyvylaKAy9tmV8UNQALYkZlU7AMybEu0HF2lJP17YNn43hSgzJKinge9jjyaVmWjVOYZuD+r8TJjv2b4Z65GIYLoL4CyV7AzFgNUzVzDrXMv6klC2qB7iK1lHWJvMDT7P7qFwrm3Pg=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB7PR08MB3082.eurprd08.prod.outlook.com (2603:10a6:5:1d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Thu, 1 Oct
 2020 09:28:19 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::b0a9:222:8373:97e1]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::b0a9:222:8373:97e1%3]) with mapi id 15.20.3433.036; Thu, 1 Oct 2020
 09:28:19 +0000
Subject: Re: [docs] [PATCH v3] ref-manual: document authentication key variables
To: nicolas.dechesne@linaro.org
Cc: docs@lists.yoctoproject.org, nd <nd@arm.com>
References: <20200930150227.47145-1-usama.arif@arm.com>
 <CAP71WjyoP3vLECfhG-fdfF_T0rX9FSufizM8BOXNRxuTRQc4Dg@mail.gmail.com>
From: "Usama Arif" <usama.arif@arm.com>
Message-ID: <8ead309f-c93b-4293-fe40-4e90922d357f@arm.com>
Date: Thu, 1 Oct 2020 10:28:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAP71WjyoP3vLECfhG-fdfF_T0rX9FSufizM8BOXNRxuTRQc4Dg@mail.gmail.com>
X-Originating-IP: [217.140.106.53]
X-ClientProxiedBy: LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::19) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.1.198.43] (217.140.106.53) by LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5d::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend Transport; Thu, 1 Oct 2020 09:28:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1c478b07-514f-456d-4520-08d865ec64d6
X-MS-TrafficTypeDiagnostic: DB7PR08MB3082:|AM6PR08MB4119:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4119801EADDFF3B6BA5A56FF92300@AM6PR08MB4119.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 2UTPsKR5hJT7TOkmWgZUWONZT2bqEWP6LNMHHV+LaoFYKHg/J95sNHSnVtDZigJiJDpbjVWaukn1aMLlZAsI23cqkKuSFlu9uCT2pO/tcvN5BYMH4CAdRkUymcipKM9mGPM5M+1ctdU1r19cuPu8eJoZ2deBpCIOLALCu3OUCyU8/IjZHU1ZSQNK77blTnJLZoQFnOXrHSJ1NoynkW98wzFaTjX00Hs5oefAdgPiq5xZN5AtqovBpClraph8nWOSaQi9uoR8EJ8+HjKml8h/e/6u2gYYHWFmr7OdkFo7S4jrP3/yRzxskCNN307yzM4tiKbcvQ2LzLnzHHqclqbuSPAak2N2MzDl6LZI65R0rg0fc+9Bnx4jpD6wUo9ld5jxIGjLvZKriPrP2mMfsiYIZiPmVQO17Jl+Ji2soGwGwfM1KN7AIfVHGAd6Um5u+4+sz37tROYzvh1vV8t+cQUmdw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(2906002)(16576012)(316002)(8936002)(26005)(956004)(186003)(966005)(16526019)(2616005)(31686004)(83380400001)(6916009)(478600001)(36756003)(6486002)(8676002)(83080400001)(4326008)(66946007)(66476007)(66556008)(52116002)(53546011)(86362001)(5660300002)(31696002)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 btw2B7dB/pflqISbjd6u833/hUK31aq9oize2R0bhLmMeOAwHZlVFltDb8fYTn/Q9SAlWkJ7iVzuh4qJLKvn/cd61mabzA97GUBNyhw1neNLL/MZowcmt5mSA3aFLgwHiUwC7w+QdmHdumfbrZMFvUE90T/qD0uSslgnsGsETy4QCsiLtGPuExLiMLMLHaBTNrbYFsAywNIvJHmqazQQy4SPJLr7m2bAA6Mloza//OBMyCTqlBGMoDPCu/pzTZVlzvAYIcNO150NtWE7YZyw5c81hPMK/qDDT17y9LIDuFnAuU2nxFixxwcqfygWG8/0wHdHJmMyr1zD5iWXVujUjWo9tMS5LZPipMljvgXydNi3ulMk2hfNmsoXBoKO53xqwdMoi4alvzBDD5zwzmXycg76SgmBH7rRIPC3ZAwPDv5f/I9NMRHvlcVdcqexjhQYhSRFCi+Qt/AcjZKD3yud4E+7sO1ycJQuNfF1QTc2WlthvgDs1ZCB7j9RNtGZH2sedhHWTUG0vl9t3BloB467nyLU4bSouDqVVeBxubhdCDIGJbL/C2mko/k9O6DC7MHAVFewEL816+4h4O71xXwUKIzRxwX0WgqaQKKrxfUkZ8dpBFGLrQYu26nE+6E0ts0VZOzvXTm3JtHmvyH3EM8yGg==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3082
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9bacdcbc-d921-4320-a46f-08d865ec5559
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BCZqd3l4Mu7EZbrXvwmwdP0g34oEZFOnFj86qq9MXVBezehq1BGTXVbP/w4kqs2omPbN8YBmL/6Ply3j3aTKibcEBpWJ3JOvdtg2kZKbKKKz0W4unxE4RysfkWpzRKUN1t/JPGZivGZF+EwUgFWwuybMcgQ8pX8sE1mocM+Ib2UVqi1jBpQyUW0DAbwe17Uw7d71g/md0Omy2AlV+Z34A9hWXWKxb0LKPFrKDJkg++5ZM0KWZS1D1atrZMhX8LRz8kvef1vcl8aArM8u/3ROKVS5xqF+3XvE3r7L5wGNUKj9dyIqrUfUMyQ97+k5ubodlsJZ4Q7y/HepLByVdw69TRl0ZXEJDLePAWkrxfTdP12LmO2eWeTP5/P//jX2R0OY5WJV9gnTiFmNMrt5QY9NRZJVSXDdG3hjepAJMpi+bMz65vyGxdcwTWllqPnn+23h9ZqdwOh9QBjYG/akFy1+SuYuNl54yMYA9tIG5iPTnThigQLcZVdQjDnm1EqPv4H8
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(46966005)(16576012)(316002)(36756003)(8936002)(82740400003)(83080400001)(47076004)(86362001)(81166007)(6486002)(70206006)(5660300002)(8676002)(70586007)(26005)(16526019)(34206002)(186003)(31696002)(31686004)(44832011)(336012)(2616005)(956004)(82310400003)(2906002)(478600001)(966005)(53546011)(83380400001)(356005)(4326008)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 09:28:45.1296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c478b07-514f-456d-4520-08d865ec64d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4119
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 30/09/2020 20:28, Nicolas Dechesne via lists.yoctoproject.org wrote:
> On Wed, Sep 30, 2020 at 5:03 PM Usama Arif <usama.arif@arm.com> wrote:
>>
>> This documents the variables used to create keys for
>> signing fitImage.
>>
>> Signed-off-by: Usama Arif <usama.arif@arm.com>
>> ---
>>   documentation/ref-manual/ref-classes.rst   |  4 +++-
>>   documentation/ref-manual/ref-variables.rst | 23 ++++++++++++++++++++++
>>   2 files changed, 26 insertions(+), 1 deletion(-)
>>
>> diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
>> index 60ce8efd21..b007e34826 100644
>> --- a/documentation/ref-manual/ref-classes.rst
>> +++ b/documentation/ref-manual/ref-classes.rst
>> @@ -1413,7 +1413,9 @@ variables :term:`UBOOT_SIGN_ENABLE`, :term:`UBOOT_MKIMAGE_DTCOPTS`,
>>   :term:`UBOOT_SIGN_KEYDIR` and :term:`UBOOT_SIGN_KEYNAME` are set
>>   appropriately. The default values used for :term:`FIT_HASH_ALG` and
>>   :term:`FIT_SIGN_ALG` in ``kernel-fitimage`` are "sha256" and
>> -"rsa2048" respectively.
>> +"rsa2048" respectively. The keys for signing fitImage can be generated using
>> +the ``kernel-fitimage`` class when both :term:`FIT_GENERATE_KEYS` and
>> +:term:`UBOOT_SIGN_ENABLE` are set to "1".
>>
>>
>>   .. _ref-classes-kernel-grub:
>> diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
>> index cf37703814..e206871c94 100644
>> --- a/documentation/ref-manual/ref-variables.rst
>> +++ b/documentation/ref-manual/ref-variables.rst
>> @@ -2585,6 +2585,11 @@ system and gives an overview of their function and contents.
>>         For guidance on how to create your own file permissions settings
>>         table file, examine the existing ``fs-perms.txt``.
>>
>> +   FIT_GENERATE_KEYS
>> +      Decides whether to generate the keys for signing fitImage if they
>> +      don't already exist. The keys are created in ``UBOOT_SIGN_KEYDIR``.
>> +      The default value is 0.
>> +
>>      FIT_HASH_ALG
>>         Specifies the hash algorithm used in creating the FIT Image. For e.g. sha256.
>>
>> @@ -2592,6 +2597,24 @@ system and gives an overview of their function and contents.
>>         Specifies the signature algorithm used in creating the FIT Image.
>>         For e.g. rsa2048.
>>
>> +   FIT_SIGN_NUMBITS
>> +      Size of private key in number of bits used in fitImage. The default
>> +      value is "2048".
>> +
>> +   FIT_KEY_GENRSA_ARGS
>> +      Arguments to openssl genrsa for generating RSA private key for signing
>> +      fitImage. The default value is "-F4". i.e. the public exponent 65537 to
>> +      use.
>> +
>> +   FIT_KEY_REQ_ARGS
>> +      Arguments to openssl req for generating certificate for signing fitImage.
>> +      The default value is "-batch -new". batch for non interactive mode
>> +      and new for generating new keys.
>> +
>> +   FIT_KEY_SIGN_PKCS
>> +      Format for public key ceritifcate used in signing fitImage.
>> +      The default value is "x509".
>> +
> 
> We probably should be sorted alphabetically.
> 

Thanks, fixed in v4.

Regards,
Usama

>>      FONT_EXTRA_RDEPENDS
>>         When inheriting the :ref:`fontcache <ref-classes-fontcache>` class,
>>         this variable specifies the runtime dependencies for font packages.
>> --
>> 2.17.1
>>
>>
>>
>>
>>
>>
>> 
>>
