Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.81])
 by mx.groups.io with SMTP id smtpd.web10.21304.1599575169125380438
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Sep 2020 07:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EVzSED9Q;
 spf=pass (domain: arm.com, ip: 40.107.7.81, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=596lsNy9aZPwo0APqkaW007Upr0eyQjFsdqVrCNjQJM=;
 b=EVzSED9QtmAQe/LbEiiFgDAd02LOcpOuH0K3g0fTCUkmkJIxJ0MQw2jfu0jVliONTmd5UKE9hL26slVyPjt06pnSdOClkU2NW7Ty0QFoOIsCl5qafzK0ZHTbXl6vXhC1MPwHFRvm0j363+JeqPLyf2QEVfbyjfVgFbjE73p0uRY=
Received: from DB6PR1001CA0018.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::28)
 by AM0PR08MB3780.eurprd08.prod.outlook.com (2603:10a6:208:10a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Tue, 8 Sep
 2020 14:26:05 +0000
Received: from DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::52) by DB6PR1001CA0018.outlook.office365.com
 (2603:10a6:4:b7::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend
 Transport; Tue, 8 Sep 2020 14:26:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT017.mail.protection.outlook.com (10.152.20.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Tue, 8 Sep 2020 14:26:04 +0000
Received: ("Tessian outbound bac899b43a54:v64"); Tue, 08 Sep 2020 14:26:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3cb028884cc8096a
X-CR-MTA-TID: 64aa7808
Received: from eab00b605742.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 39FCDC3C-185F-4DAF-8B5C-7698CAAF5DF4.1;
	Tue, 08 Sep 2020 14:25:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eab00b605742.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Sep 2020 14:25:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnI/l8LTq2WSak26BjlaJKb0XjYVZtQD6PghHE+xehqxvnBmC+l5DUQVY+qdsHTyYD1Kh1vurenabqy7aD7JGJwjkt5Q6iWLge9smKWj6G02GMANkpFpJiwsVW9qY20QzBylA9YqThgH09SETAJMZxUxOpb3p1YCbMn78UDTa7g+uhfLtHxvMTlcFNMkCQ5ql+wCoyNM/ch/x6elZNsGf+N0zpMwsZ2FdXdGwzzCfo66/ILHzOWZ9pSs7AOoB8YMGbyFb6CptDw2+9kiMphhSnTmZOAmvz2KpNEZRLwnlyN89kgiL1xzaDrjx02EtLkykxDz9shssdMpwIsPrFk3yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=596lsNy9aZPwo0APqkaW007Upr0eyQjFsdqVrCNjQJM=;
 b=auCCTFrGHOjeteSRNlj14wcPY7HWHFnEQw446dClyvHDG2ZgzjSuhQBbP1FKqaHNxpvZBOCqbswh2/Ksm6e8lkssGvNhHaS52uRQfPX3trjhRdE2HtF1ao57OBhyBgbI0TcfSR3+wkDuschswMmDRS12IbW3mroYzgR2uIczFEehDz0gJGKXhu0sMVFjoCx4uVcnM9Y9c7ix1o4M20e/7OIoysfIgjqgdheDm2hzaOZpxP4+XMeO7jytsBKBm2V0paQessgVS8P7I6eIglGwTzBFgAjA8+11cLG52VVRYkr+a3zXkbpwg8SJ3UWvTdFDhOlkl/VAZh6hXl+g+mnexA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=596lsNy9aZPwo0APqkaW007Upr0eyQjFsdqVrCNjQJM=;
 b=EVzSED9QtmAQe/LbEiiFgDAd02LOcpOuH0K3g0fTCUkmkJIxJ0MQw2jfu0jVliONTmd5UKE9hL26slVyPjt06pnSdOClkU2NW7Ty0QFoOIsCl5qafzK0ZHTbXl6vXhC1MPwHFRvm0j363+JeqPLyf2QEVfbyjfVgFbjE73p0uRY=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB8PR08MB5243.eurprd08.prod.outlook.com (2603:10a6:10:bf::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Tue, 8 Sep
 2020 14:25:24 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%6]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 14:25:24 +0000
Subject: Re: [PATCH] ref-manual: document authentication key variables
To: docs@lists.yoctoproject.org
Cc: nd@arm.com
References: <20200908122912.39196-1-usama.arif@arm.com>
From: "Usama Arif" <usama.arif@arm.com>
Message-ID: <04464025-9a05-e81b-106b-0d5b97b42c10@arm.com>
Date: Tue, 8 Sep 2020 15:25:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200908122912.39196-1-usama.arif@arm.com>
X-ClientProxiedBy: LO2P265CA0473.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::29) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.1.198.43] (217.140.106.53) by LO2P265CA0473.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend Transport; Tue, 8 Sep 2020 14:25:24 +0000
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 53926cf8-b97a-4f05-2be9-08d854031e37
X-MS-TrafficTypeDiagnostic: DB8PR08MB5243:|AM0PR08MB3780:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3780454D719E9B9163AB725B92290@AM0PR08MB3780.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fR7+Spo5Zl2eQH/jILQUvN3YBTvOyEuCBdW8aBE1EPMGTyNEXTnAtFT7wqSpe6DKhZOLaTorxGZ4iMsCUBMbsAOJTux6Pw5+xQHyEsJTOGi6nbtYTAyYJ2Vo0MKUrvu6UwwfNyydz4bywJJqs4UgI/Scxp+FrKBsePPhBX/1qh6gzxq+T9XJN+2yRu8Gqq41Zp6PAe/M4+EYo5oOlSxczI0pLEt/mS33q9YgznACEhbipaVLb5XKIpzE+DzlL0JIpIa4EIOqsxz7w0id0Wdswls08vVL8PilqHAMY6sauK2RJmO6mOBEzmEkpWZfAotvqet5nfMRB3Kw2Itz+6E0rX2j+c7udC/4bTl+/JtQmrJBkGd6jGYD9wYcNr8fy/efKJtKncvQmb0ChaRdwFnzCgdnz2Pdh6zI8qusf5USr/WlTIorh9RnLQCt43jJ3Ox/9uhA90F/eQ3y0XlqKAbJ2w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(478600001)(8936002)(966005)(86362001)(31686004)(6916009)(5660300002)(2906002)(53546011)(52116002)(16526019)(26005)(44832011)(316002)(186003)(16576012)(6486002)(36756003)(4326008)(31696002)(956004)(83380400001)(2616005)(66556008)(66476007)(8676002)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 ZhXYJubMApU3RAufkj4V/40cfvmKO9clGzkTzRpy/rZNtgYeV5xzhVp8+nrmvVCUWDcVQTozVDCglQDW62A/oVY+VApk8Tu42G7Tg8OERRYOZkaI2j5tU2y4LE5Li7T4ItTFe7mQZYhM3JFanLkUsGn4/60L/hLk9kNUA0QKXEvP+3vIbO20Nok6KmtDce4Rgwx6acaZXGU2NA8iTGhGEiY2QBSostGj7C9WIXNHoAbQVw1d4cefjEeJS63wovh90lv1+ww3rTh78hDEJWGuOfzulOud0vN8hh3b0KILO+LxaBF6ltR73F5Yq1tN4t5gEBwhQBFU8NEaTwyHKH+vBe83ubSulQJ8H+LQPzpXWfyoWxKCyYu67n7GRz2ShQoNhVdc8+0WnR2I7VYm+hZT7Lblzx3N/wUhh1LRZLYmha9DlGdTuI2ceW1yYgCc6caglpF+gzbebBHo9hbAaelpfe/KfAMpBOVtv806mott/RGloz+gJkiYKrD8kyvEAelpyWMCHOkA3MmGFq749B5LBMWsrShB+FOO3/zeeJBnzMwHrmqVnGOdYgMbrpGke946vnEhhqPDVQEaTaihI/fxCHnYtF3SBghK+uLerW2NNgzoIR4ts/WbZyki53/gPhHy5p2mz/lXlLXBWVdO/uepeg==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5243
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1d35210c-34ca-41be-c473-08d854030653
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	thD03zOr4v9f7s0SQla9BaVoCFVnbZ5fO29nkgADPAwUMYRAr4oHgIqwDMlUX/Y7Njv38HbqmX6K4M5InVv9Yc2gpDIhYBWdR497RSZb3tTzQ4KmNK/bG1pUyVgzvXEFSJedcQTSMhJ8Q0fgEMS9brKvQrjXvR7KgALRGbAvbRR65rG4dRJlX2FuQfhOA+l6XPnbaErrHRqcbE8J6IG1/Dc0HVh0JVtIbxVUYKGXb8Wg6LEf4B0soD1Xg5NvHdJBOAyvP5dgCnFvxu2yQFwK/4PeT/Qk/HubveLt4s4Pole2bWDw19x3EZJOpYD+LK51/7fmxYK8LM4YZqmm0yFhDFu/4CmtfyggHDULwmfjivjb6kt6UFY+j4kich+QM7qcHd3DvoXfW82X+KjC0FbjJ0ytSNN83kcqC1pITTIT1d1j+aAU8KIc4XGz38e4ma3H192mkMaQWrENUnxZ7mEcGR1Jwc5NBdtwmTDYyt8klUWOEUCIDHbS/19SXh3wfGBd
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966005)(336012)(86362001)(6916009)(478600001)(8676002)(26005)(31686004)(31696002)(356005)(53546011)(47076004)(186003)(16526019)(82740400003)(83380400001)(8936002)(16576012)(81166007)(2906002)(2616005)(5660300002)(956004)(36756003)(82310400003)(70586007)(4326008)(70206006)(316002)(6486002)(966005)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2020 14:26:04.1412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53926cf8-b97a-4f05-2be9-08d854031e37
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3780
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The patch that implements these variables is at 
https://lists.openembedded.org/g/openembedded-core/message/142262

On 08/09/2020 13:29, Usama Arif wrote:
> This documents the variables used to create keys for
> signing fitImage.
> 
> Signed-off-by: Usama Arif <usama.arif@arm.com>
> ---
>   documentation/ref-manual/ref-classes.xml   |  7 ++-
>   documentation/ref-manual/ref-variables.xml | 67 ++++++++++++++++++++++
>   2 files changed, 73 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
> index 1dcd5fdd03..03151c10bf 100644
> --- a/documentation/ref-manual/ref-classes.xml
> +++ b/documentation/ref-manual/ref-classes.xml
> @@ -1953,7 +1953,12 @@ This check was removed for YP 2.3 release
>           and
>           <filename><link linkend='var-FIT_SIGN_ALG'>FIT_SIGN_ALG</link></filename>
>           in <filename>kernel-fitimage</filename> are "sha256" and "rsa2048"
> -        respectively.
> +        respectively. The keys for signing fitImage can be generated using the
> +        <filename>kernel-fitimage</filename> class when both
> +        <filename><link linkend='var-FIT_GENERATE_KEYS'>FIT_GENERATE_KEYS</link></filename>
> +        and
> +        <filename><link linkend='var-UBOOT_SIGN_ENABLE'>UBOOT_SIGN_ENABLE</link></filename>
> +        are set to "1".
>       </para>
>   
>   </section>
> diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
> index a5064807e5..2c9f551077 100644
> --- a/documentation/ref-manual/ref-variables.xml
> +++ b/documentation/ref-manual/ref-variables.xml
> @@ -4991,6 +4991,22 @@
>               </glossdef>
>           </glossentry>
>   
> +        <glossentry id='var-FIT_GENERATE_KEYS'><glossterm>FIT_GENERATE_KEYS</glossterm>
> +            <info>
> +               FIT_GENERATE_KEYS[doc] = "Decides whether to generate the keys for signing fitImage"
> +            </info>
> +            <glossdef>
> +                <para role="glossdeffirst">
> +                    Decides whether to generate the keys for signing fitImage
> +                    if they don't already exist. The keys are created in
> +                    <filename><link linkend='var-UBOOT_SIGN_KEYDIR'>UBOOT_SIGN_KEYDIR</link></filename>.
> +                    The default value is "1" if
> +                    <filename><link linkend='var-UBOOT_SIGN_ENABLE'>UBOOT_SIGN_ENABLE</link></filename>
> +                    is set to "1", otherwise "0".
> +                </para>
> +            </glossdef>
> +        </glossentry>
> +
>           <glossentry id='var-FIT_HASH_ALG'><glossterm>FIT_HASH_ALG</glossterm>
>               <info>
>                  FIT_HASH_ALG[doc] = "Specifies the hash algorithm used in creating the FIT Image."
> @@ -5015,6 +5031,57 @@
>               </glossdef>
>           </glossentry>
>   
> +        <glossentry id='var-FIT_SIGN_NUMBITS'><glossterm>FIT_SIGN_NUMBITS</glossterm>
> +            <info>
> +               FIT_SIGN_NUMBITS[doc] = "Size of private key in number of bits."
> +            </info>
> +            <glossdef>
> +                <para role="glossdeffirst">
> +                    Size of private key in number of bits used in fitImage.
> +                    The default value is "2048".
> +                </para>
> +            </glossdef>
> +        </glossentry>
> +
> +        <glossentry id='var-FIT_KEY_GENRSA_ARGS'><glossterm>FIT_KEY_GENRSA_ARGS</glossterm>
> +            <info>
> +               FIT_KEY_GENRSA_ARGS[doc] = "Arguments to openssl genrsa for generating RSA private key."
> +            </info>
> +            <glossdef>
> +                <para role="glossdeffirst">
> +                    Arguments to openssl genrsa for generating RSA private key
> +                    for signing fitImage.
> +                    The default value is "-F4". i.e. the public exponent 65537 to use.
> +                </para>
> +            </glossdef>
> +        </glossentry>
> +
> +        <glossentry id='var-FIT_KEY_REQ_ARGS'><glossterm>FIT_KEY_REQ_ARGS</glossterm>
> +            <info>
> +               FIT_KEY_REQ_ARGS[doc] = "Arguments to openssl req for generating certificate."
> +            </info>
> +            <glossdef>
> +                <para role="glossdeffirst">
> +                    Arguments to openssl req for generating certificate for
> +                    signing fitImage.
> +                    The default value is "-batch -new". batch for non interactive mode
> +                    and new for generating new keys.
> +                </para>
> +            </glossdef>
> +        </glossentry>
> +
> +        <glossentry id='var-FIT_KEY_SIGN_PKCS'><glossterm>FIT_KEY_SIGN_PKCS</glossterm>
> +            <info>
> +               FIT_KEY_SIGN_PKCS[doc] = "Format for public key ceritifcate."
> +            </info>
> +            <glossdef>
> +                <para role="glossdeffirst">
> +                    Format for public key ceritifcate used in signing fitImage.
> +                    The default value is "x509".
> +                </para>
> +            </glossdef>
> +        </glossentry>
> +
>           <glossentry id='var-FONT_EXTRA_RDEPENDS'><glossterm>FONT_EXTRA_RDEPENDS</glossterm>
>               <info>
>                   FONT_EXTRA_RDEPENDS[doc] = "When a recipe inherits the fontcache class, this variable specifies runtime dependencies for font packages. This variable defaults to 'fontconfig-utils'."
> 
