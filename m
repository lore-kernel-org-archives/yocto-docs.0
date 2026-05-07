Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77306CD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 09:49:17 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8079.1778147353692716509
 for <docs@lists.yoctoproject.org>;
 Thu, 07 May 2026 02:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=BSYM8lcz;
 spf=pass (domain: cherry.de, ip: 52.101.65.59, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvzajzGYrRylZPDeRimbVISw9rFzsGLp7LLZT0T0WEstiar8GwyBmvTIt4e5z+4kyICbSLXW7Hmk4INKUKKeTg1PiPbjUsl2z4lla7K5wtR3K7ZAEMBuTtgESFPB1YERl6NyeNj56WQZd4/qlvfRGqnwm342IBLT5+F7FiboE60O55HGYpg5w/Zj3BLgRDyDCNPVu2zcau49CVdQQGpIMNJJoB7AabyYw1TdusTOZGGDOaWNrK58tfx2ix4gGZKN2bZjeYEppPmROkT5XrHsGutYUhz0sXBYXyhuXM6hLGzkVPWn8yTtuLN8yW9+WaXWOruxvwAB3gbRNNhDW8+ILw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzQE9YiYhJGuOlYlLqtf/tsirWQjbOSr2Oi0jt6E6oA=;
 b=YXLdYBFfoqHss8oXS8FSRSfYexppICoEQOaIBYqcH6r45iGdaQj9SJK3Dw6IFbD7K5rYraDv5qBIZwOxATB97hgBlCJ2v9DVjf04S/RrhK3FMPqBknsaYwCNdyN+TIrcgYys8NbWisUqAPd8HK2FsZZspszYmIk0VqVQotD1f64wTz1KB20JDvMdj/3ubrGeK3RfYcvynYINmf7ETY5dbb8i3V0iHtNAl4dDP4E1Gd3Z0NPcC+Jt26N9VqdCcd8nUyYZtskHpbwmLaJ4GQ3spbZ4e6OZhhh61U6nI+zKiKjDrmZehYI0Y6K0bD+cSXai7w/2dTkZymQ9buGVBEmZtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzQE9YiYhJGuOlYlLqtf/tsirWQjbOSr2Oi0jt6E6oA=;
 b=BSYM8lcz+ifjTwaz34UDZtE6qP7roSa2kG7yJqnlCt/WqqvWGNdcZvV2dDNb67d4GwHB0hDE83MYOSPL47Bob4tO5zP7kQsWj7coYfDrKLF4zhtvr6ssl1w/CW6e/4VutbEmGlRZkVZgn8AGU3nEYs4+KnpNo/sLWmRHsk1sLN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PA1PR04MB10118.eurprd04.prod.outlook.com (2603:10a6:102:45b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 09:49:09 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 09:49:08 +0000
Message-ID: <e5ac74f3-0b61-4e30-bbf4-0b9aeb725e94@cherry.de>
Date: Thu, 7 May 2026 11:49:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3] Document shared state signing
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260428-sstate-signing-v3-1-52cc8177b4ff@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260428-sstate-signing-v3-1-52cc8177b4ff@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PA1PR04MB10118:EE_
X-MS-Office365-Filtering-Correlation-Id: cde59269-293a-48da-cfaf-08deac1de27b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|4133799003|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	MGc2/7j09x9Cz4XJotxifUuCsneTXBhSTcNIFG7TTeLlA+E/krwUQ8VHbtlz23gXe6Pt3czmcKebA5oe+H7DLTyoO/ZiBn8VN011cIc1Fm4mHx+98QmnPIb+tN62ULgI3xIdkzTd/+nZrjmUzSSK7roVZfHHMg2N8j9U98SX+OBfSkgJyikv1Y4gx+9Tg8dfPjMPRdWjweqFDwCboEs8zOypef52dE5i0RB6ApA26O2PywNh7dniUbT4vQPUgJwd5rbsAN967rf5pd+XnbmP/hsCMQxBjO6YfKocgZQJ8z8Zhf3YTXlDQeLD6NQ+L9x9O3bqs7witSSyT6rmBB8IpHOZkKnjVMDOy7JhgF8Lkd9UmFKXZWUEJJsUEprzqDm3a3At6IOch/N3FmqW2x5QTKxpo5TGZm7+KMzPqErrGBP1DDPXbrblF3PzN0b/yns0BKhwcbun4MM35z26vwx4pl7b4IWN/AR2Rhcmvya5ztASVRZb77dbMjId2ZR6q0Iux73bUbjCDoxIE48tb47h88CnZEh5yjtaSffAwMiUJQkCL3ene14ZlgTMzxObmRdzqyhwHBsx+xvaGZBi1cQq6ZyLQ8R6V+5ZSp/6latVLrhIHWsw5V4vKmXsHgGlu0CX9SF1itzGOIB5eAUufdNWLQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4133799003)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dGhkOUo0RFQ2WWZCMFFrSEdXNllhR2xqMldybGpwNEVlVlVnWEZDNUQxTFp4?=
 =?utf-8?B?SnFSVFhtc2Ixek9RczVqeFJBWkhTK05QUzJTOVZWeVM0Z3lRVmF3RmFmL1F0?=
 =?utf-8?B?WXhXTjZmeXJsUkNMRmoycXROSGRlRWpVWUxFZXRVRm1GeXVEaVdxSVpEdU0w?=
 =?utf-8?B?L2RUVElwZFd1VUpnejcrN3FBNDNQdkRaN1FRZDVjcC90SHhzOEQzMGNDSXpw?=
 =?utf-8?B?REE0NFJmSmFhUkpGYU1tOHVEYUpSYXdLbUtsbjdaOXZQcHd3dHpudDdDYmxs?=
 =?utf-8?B?clAwYmtaVWU3OXJVako5MmJFWGJUdjJuL0YxODh6U1hJcTRaS01LQzA5eVVk?=
 =?utf-8?B?aUFObUFlajZaMXBZYmViSGVGdjRnMU92dm8yNXNmc08zMlZtUTVZZWlwMnRv?=
 =?utf-8?B?aWpCdVpmK0FkQVRyVEpYZzN5ek4vY2ZFa2pTb3hjaEpJLzdLSVlhd0ZaQ3or?=
 =?utf-8?B?VTRKSFFUZ2RaaU0wTk50ZzdVU2JCS29HcjZ4TlJBaU9lM1BGTlUwNW1hNUhW?=
 =?utf-8?B?WHB2cHpvc01FRWVGd0s3bW5idW1VYmFuVGVUbkpnbkZCUUFjckVMSDV5MS83?=
 =?utf-8?B?dStVYm51Vks3NC96QkVKRHlJSkZDdWo4MHFMa0Zob2JvN2RqcmJTSFpkY3Aw?=
 =?utf-8?B?dmcvcVM5K08zc2lnWkdqTmJ4ZzVjVEszS0JnVXM5TTdiaFg1dUFIYnVMaDlq?=
 =?utf-8?B?RkxhS3I0YUZwbE9aVE1pQzlVMWhxVDdQZHVjclI3QnhWZlNwNUFoN0g3NEcz?=
 =?utf-8?B?S3NPSW1JNytnc1BjR0lPcFF6WlBRR2ZGa0wyb1FvajRTWmoxb3hsVW9QVlg4?=
 =?utf-8?B?RVoyY2VlSXpONm1HZ0kxOXAwOVNCNGNXWDB3Rm9kdldMRTI0TENpQlZyUEtp?=
 =?utf-8?B?bEtDdUs0U2FhcUlzNlgzUlNLcnF6TVg0SGZUbUtVMGNIQUlrampXdjJQRzlk?=
 =?utf-8?B?RkFDUjVocDdTbm9GekVZeEpCM1VqRzVtanp1U2FUU1BGaTZ1YTB2Nm55aTVy?=
 =?utf-8?B?UmdHN3hTRm1UUkZ3ZWdLWkVhaC9oUW5HekMzTC9OaFR6OEt2dFJqbHRXcFVs?=
 =?utf-8?B?OW12blN4V3pIVFdPNkdPdnNPMzZYUkQ2U3VuVHd0RzZMSTRoWXR0YVBRMElv?=
 =?utf-8?B?RkU4NVJqd2IyV3VZaC9YbVNzNmhZMElYL1VVLzVVY1ZIOGtZOGFxZS9JUnZY?=
 =?utf-8?B?Y1p2aVJhbXcrVzFRMlNYQ1BWbE9rdkNIOENXUmc1OU9CS2pMU0g1M1FXMFNN?=
 =?utf-8?B?THlLMCs0bTlqZ1lHRitiNkZwQUp4VERnNzg5LzAyc1ZMMHhFZzNER2VuNTBk?=
 =?utf-8?B?dlFsQ3hiOFFmVDhiOGlDM1lkeG5zL0hWYW5haHg0ZjhtdzFQdXhlNmV1NU5l?=
 =?utf-8?B?OWxCbnFvVVBoRUFENUx3K054SDMxTDg3cDdvYkozcUdUV0dVaGtvRGJlSVEz?=
 =?utf-8?B?c0hNOWZGRHdzZFlzQlZ6QUdHcEIzWmVSK3JJUzhGWGZMYlBqdkxLQ3c5NkZO?=
 =?utf-8?B?N09tell6bEVEbTliUHZ5SU5wblhQSWJsWHRSYTNWRUpiMmJjYU0zSkptVWZw?=
 =?utf-8?B?WmU5dXJTc0JOMlcrbzRpSHFYbERybXdiUi9mcTdVbGtpOGFLcm5Icy8wd1Ey?=
 =?utf-8?B?cWFxS3ZPY0pka3dJMmw2bzN1WnJ3Tis3V1ptL1JmakZReTZCWW9KeDJuTVVI?=
 =?utf-8?B?b2dTaGkva0xjR3Z4cjVnK2g5NzMzcXZiY2hxenY3azk2U1FUcWxDSzBjekNU?=
 =?utf-8?B?ZXlmemczSUpPRS9jbU1tL09ZcjAwaEFCVnhXZ0FocmpYRVgrZEk0ZFdsZnNO?=
 =?utf-8?B?NVRzVlpRMXYvTVZqZFZTdVhJQXZEUjNFcmxYZG1mdjNlcnl0aVRPNks4d3BF?=
 =?utf-8?B?aFNKQk1FRWNMSVo1VkFHeHRyV2dlR1c4VHM1YnNCZElaZS9hS2x4QmxSSG5N?=
 =?utf-8?B?SjNYQXdsaHVUUXprcmVrbjJhdGFldWRwTzkvc2V0KzRMcGJQUjZYLzFFRHNY?=
 =?utf-8?B?VUsrSDNYSjcxY3pjTXZqTUxsMno5OFR4MmV5U2plbHpZckZIbityN1FQdHhG?=
 =?utf-8?B?T2kvVkxrVjNpMHlwSWIzSkpYZCtuRXhacnNodWFsRldmV3VhUmFycVUwK2JZ?=
 =?utf-8?B?OXBmV0tITldDaEJXU28yZEFjaU5iQ2cyS3pmMFM0WW9YUTBnK0tjb2U4N3M5?=
 =?utf-8?B?WFFwVEJKOFlhNzNEc3cveDJ6SWxVdkVDdmNVMEFlbno2b2owQytIWjVzbnlr?=
 =?utf-8?B?NXVCL1F0clIrRjJUMHlJak9lYlVSNlZWVkdpZzE0QW0xSU14YmIxRytuVUNM?=
 =?utf-8?B?VER1em9zMWVhV2dRQWtJOTQvYmRXTkNkcnhKa3lNQnU5SUVmMjROdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cde59269-293a-48da-cfaf-08deac1de27b
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:49:08.8334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0XXkeYuIz+gOHvrtptUabWr9OMLBxS9OvAZsfHmgrF/CrypOlZtehbPEFSWYaP9uKBZmMPEFg2V+VS9tDCThGfbwJRQoMOJIUJn5lurInw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10118
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 May 2026 09:49:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9397

Hi Antonin,

On 4/28/26 10:28 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Document the shared state signing feature. Add a new document in the
> Security manual, and definitions for the variables involved in this
> process in the variable glossary.
> 
> [YOCTO #15217]
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v3:
> - Rework after Quentin's suggestions (thanks!)
> - Link to v2: https://patch.msgid.link/20260421-sstate-signing-v2-1-7b572121f2fd@bootlin.com
> 
> Changes in v2:
> - Fix typos reported by Ulrich (thanks!)
> - Link to v1: https://patch.msgid.link/20260417-sstate-signing-v1-1-5df11613249e@bootlin.com
> ---
>   documentation/overview-manual/concepts.rst       |   6 +
>   documentation/ref-manual/variables.rst           |  57 +++++
>   documentation/security-manual/index.rst          |   1 +
>   documentation/security-manual/sstate-signing.rst | 285 +++++++++++++++++++++++
>   4 files changed, 349 insertions(+)
> 
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index 1faa790f3..3f3093bfc 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1239,6 +1239,12 @@ variable is the function that determines whether a given dependency
>   needs to be followed, and whether for any given relationship the
>   function needs to be passed. The function returns a True or False value.
>   
> +.. note::
> +
> +   Is is possible to sign these artifacts with :wikipedia:`GPG

typo: s/Is/It/

> +   <GNU_Privacy_Guard>`. See :doc:`/security-manual/sstate-signing` in the Yocto
> +   Project Security Manual for more information.
> +
>   Images
>   ------
>   
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index e713204e3..3b3aeed4c 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -10113,6 +10113,25 @@ system and gives an overview of their function and contents.
>   
>         For details on the process, see the :ref:`ref-classes-staging` class.
>   
> +   :term:`SSTATE_SIG_KEY`
> +      When signing :ref:`shared state <overview-manual/concepts:setscene tasks
> +      and shared state>` artifacts (when :term:`SSTATE_VERIFY_SIG` is set to
> +      "1"), the :term:`SSTATE_SIG_KEY` variable is the :wikipedia:`GPG
> +      <GNU_Privacy_Guard>` key identifier used to sign them (with the private
> +      key).
> +

thought: I'm not sure we need to specify that the private key is used 
for signing. That's what signing in asymmetric cryptography is?

> +      See :doc:`/security-manual/sstate-signing` in the Yocto Project Security
> +      Manual for more information.
> +
> +   :term:`SSTATE_SIG_PASSPHRASE`
> +      When signing :ref:`shared state <overview-manual/concepts:setscene tasks
> +      and shared state>` artifacts (when :term:`SSTATE_VERIFY_SIG` is set to
> +      "1"), the :term:`SSTATE_SIG_PASSPHRASE` variable is the passphrase used to
> +      protect the private key signing the artifacts.
> +
> +      See :doc:`/security-manual/sstate-signing` in the Yocto Project Security
> +      Manual for more information.
> +
thought: implement a file-based passphrase?

The detach_sign() function actually supports providing the passphrase 
either as a string or from a file. The file-based implem seems to be 
actually used for signing (ipk, rpm, deb) packages, see 
IPK_GPG_PASSPHRASE_FILE and PACKAGE_FEED_GPG_PASSPHRASE_FILE.

How much better that is in terms of security, unclear, as the file still 
needs to be readable but I guess at least the passphrase cannot leak 
when looking at the datastore (e.g. with bitbake -e).

>      :term:`SSTATE_SKIP_CREATION`
>         The :term:`SSTATE_SKIP_CREATION` variable can be used to skip the
>         creation of :ref:`shared state <overview-manual/concepts:shared state cache>`
> @@ -10133,6 +10152,44 @@ system and gives an overview of their function and contents.
>   
>            SSTATE_SKIP_CREATION = "1"
>   
> +   :term:`SSTATE_VALID_SIGS`
> +      When verifying :ref:`shared state <overview-manual/concepts:setscene tasks
> +      and shared state>` artifacts (when :term:`SSTATE_VERIFY_SIG` is set to
> +      "1"), the :term:`SSTATE_VALID_SIGS` variable is a space-separated list of
> +      :wikipedia:`GPG <GNU_Privacy_Guard>` key identifiers to use to verify their
> +      signature.
> +
> +      It must contain the short form identifier of the key pair. For example,
> +      when running the ``gpg --list-keys`` command (in bold text below):
> +
> +      .. parsed-literal::
> +
> +         pub   ed25519 2026-04-17 [SC]
> +               \4049A47E3AAA99D0250966DC\ **5B97632FA7F4E942**
> +         uid           [ultimate] Antonin Godard (SState Signing) <antonin.godard\@bootlin.com>
> +         sub   cv25519 2026-04-17 [E]
> +
> +      The short form equals the last 16 characters of the identifier. In the
> +      above example: ``5B97632FA7F4E942``.
> +
> +      .. note::
> +
> +         Leaving this variable empty will make the :term:`OpenEmbedded Build
> +         System` let any key installed on the :term:`Build Host` be used for
> +         verify the shared state artifacts, as long as its private key

typo: s/verify/verifying/

suggestion (non-blocking): reword

A bit heavy to read, what about:

"""
If this variable is empty (the default), any of the available GPG key 
can be used by the :term:`OpenEmbedded Build System` to verify the 
shared state artifacts.
"""

In any case, I would strip the "as long as" part of the sentence, as 
that's how asymmetric cryptography works, you cannot validate a 
signature with a public key that isn't the other in the priavte-public 
key pair, that's the whole point of verifying a signature.

> +         counterpart was used for signing them.
> +
> +      See :doc:`/security-manual/sstate-signing` in the Yocto Project Security
> +      Manual for more information.
> +
> +   :term:`SSTATE_VERIFY_SIG`
> +      The :term:`SSTATE_VERIFY_SIG` variable controls whether to enable or
> +      disable the :ref:`shared state <overview-manual/concepts:setscene tasks
> +      and shared state>` artifacts signing feature.
> +
> +      See :doc:`/security-manual/sstate-signing` in the Yocto Project Security
> +      Manual for more information.
> +
>      :term:`STAGING_BASE_LIBDIR_NATIVE`
>         Specifies the path to the ``/lib`` subdirectory of the sysroot
>         directory for the build host.
> diff --git a/documentation/security-manual/index.rst b/documentation/security-manual/index.rst
> index 3453940f5..a767cd9c6 100644
> --- a/documentation/security-manual/index.rst
> +++ b/documentation/security-manual/index.rst
> @@ -14,6 +14,7 @@ Yocto Project Security Manual
>      securing-images
>      vulnerabilities
>      read-only-rootfs
> +   sstate-signing
>   
>   .. include:: /boilerplate.rst
>   
> diff --git a/documentation/security-manual/sstate-signing.rst b/documentation/security-manual/sstate-signing.rst
> new file mode 100644
> index 000000000..21cdff9fc
> --- /dev/null
> +++ b/documentation/security-manual/sstate-signing.rst
> @@ -0,0 +1,285 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Shared State Signing
> +********************
> +
> +The :term:`OpenEmbedded Build System` build system has a built-in mechanism
> +allowing to save execution time by re-using pre-built artifacts: the
> +:ref:`shared state cache (sstate cache) <overview-manual/concepts:shared state
> +cache>`. These artifacts are stored in a directory (:term:`SSTATE_DIR`) and are
> +not signed by default.
> +
> +This document goes through the steps to enable shared state signing.
> +This feature is fully dependent on :wikipedia:`GPG <GNU_Privacy_Guard>`, meaning
> +examples shown in this document will use the ``gpg`` command-line tool.
> +
> +Host Requirements
> +=================
> +
> +As :wikipedia:`GPG <GNU_Privacy_Guard>` is not part of the default :ref:`host
> +requirements <ref-manual/system-requirements:Required Packages for the Build
> +Host>`, you will need to install it on your host.
> +
> +For example, Debian based distributions provide it with the ``gpg`` package name.

typo: s/Debian based/Debian-based/

typo: s/package name/package/

suggestion (non-blocking): s/with/in/

> +Install it as follows:
> +
> +.. code-block:: console
> +
> +   $ sudo apt-get install gpg
> +
> +Verify that your installation is successful by showing the version of GPG:
> +
> +.. code-block:: console
> +
> +   $ gpg --version
> +
> +Generating A Public And Private Key Pair With GPG
> +=================================================
> +
> +.. note::
> +
> +   This step is optional if you already have a pair of public and private keys.
> +
> +You need a pair of public and private keys for two independent tasks:
> +
> +-  Signing the shared state artifacts that the :term:`OpenEmbedded Build System`
> +   generates with your **private key**.
> +
> +-  Verifying the shared state artifacts with your **public key** when re-using them.
> +
> +.. note::
> +
> +   For more information on public key cryptography, see
> +   :wikipedia:`Public-key_cryptography`.
> +
> +With the ``gpg`` command-line tool, generate a new pair of public and private
> +keys:
> +
> +.. code-block:: console
> +
> +   $ gpg --full-generate-key
> +
> +It will guide you through the steps of creating the key pair.
> +
> +Once done, you should be able to list your new key with the following command:
> +
> +.. code-block:: console
> +
> +   $ gpg --list-keys
> +   pub   ed25519 2026-04-17 [SC]
> +         4049A47E3AAA99D0250966DC5B97632FA7F4E942
> +   uid           [ultimate] Antonin Godard (SState Signing) <antonin.godard@bootlin.com>
> +   sub   cv25519 2026-04-17 [E]
> +
> +In the above example, take note of the
> +``4049A47E3AAA99D0250966DC5B97632FA7F4E942`` key identifier. This will be used
> +to configure the build.
> +

issue: can you please synchronize this example with the one in 
SSTATE_VALID_SIGS?

> +Configuring The Build System To Sign Shared State Artifacts
> +===========================================================
> +
> +Shared State Location
> +---------------------
> +
> +The build system needs to be configured to sign new shared state artifacts when
> +they are generated. The generation of new artifacts is done once a task has
> +finished being executed.
> +
> +For the following sections let's assume that the build system has the shared
> +state directory location (:term:`SSTATE_DIR`) defined as follows::
> +
> +   SSTATE_DIR = "${TOPDIR}/sstate-cache"
> +
> +Assuming this directory and the temporary directory (:term:`TMPDIR`) are empty,
> +let's run the ``create_recipe_spdx`` task of the ``gettext-minimal-native``
> +recipe:
> +
> +.. code-block:: console
> +
> +   $ bitbake gettext-minimal-native -c create_recipe_spdx
> +
> +Let's take this command as an example throughout this document.
> +
> +After execution, the shared state directory should be populated with new files:
> +
> +.. code-block:: console
> +
> +   $ find $BUILDDIR/sstate-cache/ -name "*gettext-minimal-native*create_recipe_spdx*"
> +   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-linux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf4978b2b3b617a_create_recipe_spdx.tar.zst
> +   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-linux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf4978b2b3b617a_create_recipe_spdx.tar.zst.siginfo
> +
> +These are the default shared state artifacts generated by the
> +:term:`OpenEmbedded Build System`. They are not signed with GPG by default, so
> +let's see how to add signing of these artifacts.
> +
> +.. note::
> +
> +   Despite its name, the `siginfo` file is unrelated to GPG signing.
> +
> +Enabling Shared State Signing
> +-----------------------------
> +
> +Create a new :term:`configuration file` on your host **in a safe location** and
> +add the two following statements::
> +
> +   SSTATE_VERIFY_SIG = "1"
> +   SSTATE_SIG_KEY = "4049A47E3AAA99D0250966DC5B97632FA7F4E942"
> +   SSTATE_SIG_PASSPHRASE = "<your GPG key passphrase>"
> +
> +It is advised to put these statements in a separate file as those contain
> +secrets and should not be shared. For this example, let's assume this file is
> +``conf/sstate-sig-key.conf``.
> +
> +You can make sure this file is only owned by you and not readable by another
> +user with:
> +
> +.. code-block:: console
> +
> +   $ chown $USER:$USER conf/sstate-sig-key.conf
> +   $ chmod o-rwx conf/sstate-sig-key.conf
> +
> +The statements in this file define:
> +
> +-  :term:`SSTATE_VERIFY_SIG`: setting this variable to "1" enables the shared
> +   state signing feature.
> +
> +-  :term:`SSTATE_SIG_KEY`: the GPG key identifier for signing shared state
> +   artifacts with the private key.
> +
> +   In the example, this corresponds to the identifier printed with the ``gpg
> +   --list-keys`` command :ref:`above <security-manual/sstate-signing:Generating
> +   A Public And Private Key Pair With GPG>`.
> +
> +-  :term:`SSTATE_SIG_PASSPHRASE`: the passphrase used to protect your private
> +   key when creating the key, chosen when creating the key pair.
> +

issue: redundant "when creating the key"

I can suggest removing the first "when creating the key", the end of the 
sentence is better worded.

> +Let's test the configuration:
> +
> +#. Continuing with the ``gettext-minimal-native`` example, let's first clean the
> +   existing shared state artifacts, to make sure my shared state artifacts for
> +   my ``do_create_recipe_spdx`` task are re-generated:
> +

issue: confusing switch to first-person

We've been using the second person (you, let's, ...) until now.

> +   .. code-block:: console
> +
> +      $ bitbake gettext-minimal-native -c cleansstate
> +
> +#. Run the ``create_recipe_spdx`` task for ``gettext-minimal-native``, but this
> +   time pass the new ``sstate-sig-key.conf`` file to :term:`BitBake`:
> +
> +   .. code-block:: console
> +
> +      $ bitbake -R conf/sstate-sig-key.conf gettext-minimal-native -c create_recipe_spdx
> +

TIL about -R :)

Another option is to make conf/local.conf `require` it?

> +List the files in the shared state directory again:
> +
> +.. code-block:: console
> +
> +   $ find sstate-cache/ -name "*gettext-minimal-native*create_recipe_spdx*"
> +   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-linux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf4978b2b3b617a_create_recipe_spdx.tar.zst
> +   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-linux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf4978b2b3b617a_create_recipe_spdx.tar.zst.sig
> +   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-linux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf4978b2b3b617a_create_recipe_spdx.tar.zst.siginfo
> +
> +A new ``.sig`` file was created: this means the artifact was successfully
> +signed, and the signature is stored in a separate ``.sig`` file.
> +
> +Verifying Signed Shared State Artifacts
> +=======================================
> +
> +Now that you have set up the build to sign shared state artifacts, let's see how
> +you can verify them with the public key counterpart of the private key.
> +
> +.. note::
> +
> +   Signature of shared state and its verification can happen on two different
> +   hosts, meaning one host can be in charge of the signature while another only
> +   verifies the artifacts. This is preferred as the private key should not be
> +   shared between multiple hosts.
> +
> +From a :term:`configuration file` such as the :ref:`site configuration file
> +<structure-build-conf-site.conf>`, include the following statements::
> +
> +   SSTATE_VERIFY_SIG = "1"
> +   SSTATE_VALID_SIGS = "5B97632FA7F4E942"
> +
> +These statements define:
> +
> +-  :term:`SSTATE_VERIFY_SIG`: setting this variable to "1" enables the shared
> +   state signing feature.
> +
> +-  :term:`SSTATE_VALID_SIGS`: a space-separated list of key identifiers for
> +   which shared state artifacts are accepted.
> +
> +   This means that shared state will be reused **only if it was signed with the
> +   private key corresponding to key identifier**.
> +
> +   You'll notice the short-form of the key identifier here, which are the last 16
> +   characters of the long-form key identifier shown with ``gpg --list-keys`` (in
> +   bold text below):
> +
> +   .. parsed-literal::
> +
> +      pub   ed25519 2026-04-17 [SC]
> +            \4049A47E3AAA99D0250966DC\ **5B97632FA7F4E942**
> +      uid           [ultimate] Antonin Godard (SState Signing) <antonin.godard\@bootlin.com>
> +      sub   cv25519 2026-04-17 [E]
> +
> +Let's verify that signature verification works:
> +
> +#. First, remove temporary outputs (:term:`TMPDIR`) from the previous builds, to
> +   make the :term:`OpenEmbedded Build System` rebuild everything using the
> +   shared state:
> +
> +   .. code-block:: console
> +
> +      $ rm -rf tmp/
> +

question: Will this actually work?

In the signing example, we only triggered a rebuild of 
gettext-minimal-native's create_recipe_spdx (and earlier) tasks. Every 
task which isn't from that recipe wasn't rebuilt as we only cleaned the 
sstate-cache from that recipe, therefore we would only use the shared 
state cache for the gettext-minimal-native recipe.

Cheers,
Quentin

