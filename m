Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6EEDFED3E3
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 15:18:49 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24809.1777043928006990103
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 08:18:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=IX/4A0jP;
 spf=pass (domain: cherry.de, ip: 52.101.65.29, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rqvq7xv3vRkq3zm1ZoUW0dRFlnxI+PRxGQuGKZ5QQFfH56JSx46+t9iwG2EfbBCu24je3B5ohVFtqbqDaLd0d/olG2Rog8UWgiW9HsJtOWx/eB+S+hDYahVWOVXsngGHVEUP18uiSjhHG3KFuSmWxD/l5tvnna86lkc5dbB0AF/P8e/bd4rLOoAUbDYuxXctFhI4OBx5cWrFGmhaT9n1+4X59LI0y0a3mr57DSUF0xobAQxJK++Fc6K7G6rQ7vP9skYTSCj1UkD1YgHERna4y5jwIAtID8/QwoyNTU0Gxarp5eVdHBBNEf7sPOhIoHRyGmypK4ODhGATysDlBTXuVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1npv7BjZTZ8HzXMPgUSB6tgHozKOgQDyX6i/dan+N3k=;
 b=dMWanP2oA2KDJQQBz+zHrGsYtTnHOG9NauKFc3F5mIgACzL5NZ4TQpe2iB0jzZTfMOZGMVW+EOsxheCh/70xGF19rgk5ehKqwYuFQ/GEIkOUugNpvHq9JfkWV7I6taatYI1EInLMXkwfnJvp0Yh7JQOllygwbQUBdpIj2DNNNXXNToHWPsodUaw8kIlUmAAJD4o5x36C8VLT+j1nXhbXoG2duCIpztsRyiBYWWdpZdYLRV4NlLb2EnWzajAYhorPfqRp9jkF6yp1/iAAJLIoIUtnrOfOx2br/U+XMwi1txlj4sSdr9ruUbwNSdX2h5+G+6QVkUbRj97P1yFiNERrKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1npv7BjZTZ8HzXMPgUSB6tgHozKOgQDyX6i/dan+N3k=;
 b=IX/4A0jPz2FBbuJQSy57qJ0wQneLQCbAjNSCC+sdj58czCHzQ13RzYMglg0yKGApOFKuxcnUb3MxDA3MotJLNFlQPsp3ywEUC5kuUk3QLKaJehjZpzUsMQQlAM+1kumgepD9dsqMkcE5xjEZYKjjEhFXfzlvsmBW6HJBGyW5fUk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM0PR04MB6898.eurprd04.prod.outlook.com (2603:10a6:208:185::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 15:18:43 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9846.017; Fri, 24 Apr 2026
 15:18:43 +0000
Message-ID: <a4723996-6d07-41b1-a40b-35e12e48807f@cherry.de>
Date: Fri, 24 Apr 2026 17:18:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] Document shared state signing
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260421-sstate-signing-v2-1-7b572121f2fd@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260421-sstate-signing-v2-1-7b572121f2fd@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::19) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM0PR04MB6898:EE_
X-MS-Office365-Filtering-Correlation-Id: 1654ca4e-7166-4c9d-c3f6-08dea214c59e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|56012099003|22082099003|18096099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	1EX47gy7YCJN99FHa1etgl6VPtYYoNiYttkTZSfSUgSuqFP59uKl69FJA8QD/b1LvP/b3pJiSTv3fmAj2g7OKUDUDCJKyefQ+JavUazaBvGCcW4PyCJTaQ74FrRNp9fCLcDkQ7t5Z05iPaq9pKCD5h3DywsIbQsNELwygbKf8etas9u6O8Yhve4YMDpxuQZkKR8NH9QvXovkCy6h7Ca99Pkp9hXc5fjdZo9N0jk5OiKlX70guHpmAe8smy834oL2wrwcLLFBDhfpzo88KAX5vjonGpAZB1WfLXDjj+SsxycFccPnvyxGNHtlW6kfJ5gSVubLvXIhiRsBvLUyKGbDlI5Ps6oosPlO+kopSHtWfFvCwWMwjTf4YrqvCC8GYQ4+uyy7LQu9cg5HDcqYxPubRxXFVlA/520hVHwFvmqx8U60gU1V3/3Q8B+zzL7Qt/eQQiVfBr1RRP/PmcfRBFE410+LJA9PuIup5/F525z8pzk+bemUZrNtNzI48DxJvPat/qJ2VElBN5dtj96Vb5DVetgI1RcmY5FcojGn8nPB0b6LlEKY1a0cQ10JCEWKe43yA49e4PtU9JB3vnad2qsmi5F7ajXxZo30v1clU7nJuhl3s2jZoaOyzZxJX0CQjiPIQ1mu3oACqsHvmk4r+hVUJ2dVbF6acEkeO1b/006uJmR6IAW6Vuvh2lBtyXHGx643
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(56012099003)(22082099003)(18096099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MFZqdm5iUmVlcHdDR1FHcjZoVXVMUWEyc1BMRmVWS2lTQ0R1aUl3SWxiNEdx?=
 =?utf-8?B?ZDdCSm5SOWFKR3Nmc0M1bVU5UmdZS0taV1pELzE3ODhHLzhyc3A3cFpjVEhN?=
 =?utf-8?B?YVFOUnRkL1pmaTMvRy9QMVpuK3dqTXZ4ayswbHNLRWhDaHJ1RUhQWEFmS1dU?=
 =?utf-8?B?RjhHWGtQSXRteUdFOGRteUlRVFU0VnJrWEg4SEJpZFVMS21BNHdycENleWlr?=
 =?utf-8?B?b2lzY3g0NkRZalNFeDVsUEhCc3VuM0V1bzVVaFhSRDBDMjNlSDVUMnExSk9M?=
 =?utf-8?B?ZERBZzVnbmVKM296TFZsNUFRdk55STF3bUl3d3RVcnBsNjBpclhnNkhLVE82?=
 =?utf-8?B?L1FRaWlUMTRXanh0OThnWTR4MVQ4T1ZGU0FBcllaSE5PZ24zV2JqeTM4eTZu?=
 =?utf-8?B?UDdrcjBYYTBnc2RPTEVzdHJoaTJGMFpKaHNJL0FDUlVPdTcxcDNaUkhBeDZH?=
 =?utf-8?B?QmMxYU1sdTlrQXVreWNzVllHRUI1bXRpcGt2d0s2VjJOb3M2WXJ3MnhkbnNV?=
 =?utf-8?B?di9qODZiQ2s2OTZ2UTZqdExRMlBCNzZvbmg1YklkdGtzOHNwM0EycFJhQ1Aw?=
 =?utf-8?B?V3RCTXRqRVJPa1BsRmRqSWdhZVlJVnc3YkFkbk5peHFlU2IvWEZMb2MyUWlL?=
 =?utf-8?B?cjl0WmRlOGxzdkhSaExyY0VYUGRKdmxvZmlId1hpL3QyNlU2S2JEUEo1Z1JT?=
 =?utf-8?B?ZGc2SUc2aVBDTDVYem5QSmFDcGdoSnJDeURPVmhNSmZpMDZxTFR4Y1dWWVhl?=
 =?utf-8?B?ZFEwQlo4SUdjd3lMRm5kd1hnRWRTRnJZcXp3Y09saHdrZUIvVm9tZVc5OTFh?=
 =?utf-8?B?UkJLcnZTMExGR0NtTlg0UVlKNTNOUy8xelNvN1pzWUczTWxGT3dIY0lRZENh?=
 =?utf-8?B?ZVNsV0RiMWVVRnh1YVV2V1E3aEpzQXpmZFR5aFhUY21KSDVkSjRhK25OK2Ry?=
 =?utf-8?B?RlppOGhURHpvMTdIbzFxanpMNHM2ZHd1UWZPR211ME5nekZIbHYyQ2N6a1FL?=
 =?utf-8?B?ZlRJOFZia0pOYVFUYmtEWklqMjRDdmNBcmtqN1YyTW5idHVJMWprNkRrbk56?=
 =?utf-8?B?WUtxS0VkdUFVQjg3L2lJZWROVGYwWTNPeWJURUlkeEJVMTl6V0h6bHZkS3Fr?=
 =?utf-8?B?NU51N2FWZUVmM1pRdnNyWi9Ja1dOa05tczJYZlUxUnNaclRkM1JucVE2cWg4?=
 =?utf-8?B?SkpyYUZWNm42dHpmUDdFNVB2elJzOFpzNzlmZ2djdjBCdmJ3VUpGRE1HeWZH?=
 =?utf-8?B?L3ZaVjZ4OXVYK2ZmN0lwaUVsU3dvdjZ4WmJlOEZYTUZpQmtub2FjajlWV3pa?=
 =?utf-8?B?QkdLamZCckJnVmptK3ZtaUFuQm1rK0dtLyt3Q2ZmSUFtQ1FIYWFvYnp3OUtx?=
 =?utf-8?B?WERld1hDNDNLenRhbTlJekRIdEhUMk1XZ1BNaXBiZGZZTHNoYzRpQnkvNW1Q?=
 =?utf-8?B?cnlrazZyVjFzNEVpM1JnN1ZRWWRuc1ZwVm5uY2lNejlMODJyZ1Rad296bVhF?=
 =?utf-8?B?M2dOWm91ampqK0ZJQ3FsYS9uWFMweVdzL2ZrK3krVVJsYTZ6VjNIV2l4eEhR?=
 =?utf-8?B?OVhCK2VPTDlWNUdQQ2xCRGlGQUx6OTExbFBvckxLVEVXRzArTGlmcDZPd25y?=
 =?utf-8?B?ZTFHcUFaKy92VUcxQWRKcU1kQS9iMFVrL0dpZ3ZRVkpxU3F5NFg3UERScmlZ?=
 =?utf-8?B?NU4vMXhmbHlRa3JXK25aWWVWZjR1cmJockRIQUJVR3lSMlFhVTk1T3lSbG5k?=
 =?utf-8?B?RlRXMWlNcmZQN3dHL2xseW55Vnoyc2NEa1J1R2xMYkRzVzQvakxTN0VEWVNS?=
 =?utf-8?B?UDFlM3pRWXAvNHh6MzM4QitLNUw4S2FGR1BYTWp3QmV6UFpZR25MOWI4cDZk?=
 =?utf-8?B?Ukh2VzVGd29ZWVR1WGI2d1BXMWVvdVFKR1RNZ1NVbWdqODYxYzFSL0xoR1p5?=
 =?utf-8?B?aTlUT3Q2QWlvWmNYdHk3djJseUIzOHdRQUF0dDJjRUtvODQ3bDVsZ3grdUpy?=
 =?utf-8?B?NDJ0dlZ3cEh3Zm5zZXVTTS9WMzhjbk5ZbDV5cHQwZFRaTmZLa045aHZLL09W?=
 =?utf-8?B?MnYzYmllWnRhQWszMzBrS3ZuNUJWQU90SjRvODQ3SXNVNjFyelNxMGsrQlJo?=
 =?utf-8?B?N0c5RnR5OXIwK1dCQ25hTW1mbjNTL1gwNndmZ0c2a3B4NDBTQ1dFcjNmc3pv?=
 =?utf-8?B?d013K1dyeG9OTEd0ZHpkOFdtOWJvbnZ3VWtRQ2dOY0xOcGh1VEdTamt3MXBR?=
 =?utf-8?B?ZlQ3azRWcHZjQ3I0UWRJMFlrRThKWHFEN2pIWkpWb3AvVGhCRkNwMGVRV2VN?=
 =?utf-8?B?M1o5eGlSc2FtYzFOZnF6TmdCVklwbDBjRVVGdGVwREFmYW9OYktNa2Y2ZWhx?=
 =?utf-8?Q?8ogzu2bfGBldubghDplLpJDEwM08ojRYcm63D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1654ca4e-7166-4c9d-c3f6-08dea214c59e
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 15:18:43.3047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJwSQ3/y3mPiC0wzfhQVA8+qxhx7DTsuT7JOR6XbWUZAy5WxY900upxrWv/GyoCq4NR5znvVinGJUOoQECeFPYbDNLobDi3jrZOQpfz/dqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6898
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 15:18:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9366

Hi Antonin,

On 4/21/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Document the shared state signing feature. Add a new document in the
> Security manual, and definitions for the variables involved in this
> process in the variable glossary.
> 
> [YOCTO #15217]
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v2:
> - Fix typos reported by Ulrich (thanks!)
> - Link to v1: https://patch.msgid.link/20260417-sstate-signing-v1-1-5df11613249e@bootlin.com
> ---
>   documentation/overview-manual/concepts.rst       |   6 +
>   documentation/ref-manual/variables.rst           |  50 +++++
>   documentation/security-manual/index.rst          |   1 +
>   documentation/security-manual/sstate-signing.rst | 272 +++++++++++++++++++++++
>   4 files changed, 329 insertions(+)
> 
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index ab723d7c3..f0b336226 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1240,6 +1240,12 @@ variable is the function that determines whether a given dependency
>   needs to be followed, and whether for any given relationship the
>   function needs to be passed. The function returns a True or False value.
>   
> +.. note::
> +
> +   Is is possible to sign these artifacts with :wikipedia:`GPG
> +   <GNU_Privacy_Guard>`. See :doc:`/security-manual/sstate-signing` in the Yocto
> +   Project Security Manual for more information.
> +
>   Images
>   ------
>   
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 317b75913..90d7fc924 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -10097,6 +10097,25 @@ system and gives an overview of their function and contents.
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
>      :term:`SSTATE_SKIP_CREATION`
>         The :term:`SSTATE_SKIP_CREATION` variable can be used to skip the
>         creation of :ref:`shared state <overview-manual/concepts:shared state cache>`
> @@ -10117,6 +10136,37 @@ system and gives an overview of their function and contents.
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
> +      when running the ``gpg --list-keys`` command:
> +
> +      .. parsed-literal::
> +

You could use

.. code-block:: console

    $ gpg --list-keys
    pub....

to avoid having to use a literal include.

> +         pub   ed25519 2026-04-17 [SC]
> +               \4049A47E3AAA99D0250966DC\ **5B97632FA7F4E942**
> +         uid           [ultimate] Antonin Godard (SState Signing) <antonin.godard\@bootlin.com>
> +         sub   cv25519 2026-04-17 [E]
> +
> +      The short form equals the last 16 characters of the identier. In the above

s/identier/identifier/

> +      example: ``5B97632FA7F4E942``.
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
> index 000000000..54ae92d50
> --- /dev/null
> +++ b/documentation/security-manual/sstate-signing.rst
> @@ -0,0 +1,272 @@
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
> +For example, Debian based distributions provide it with the `gpg` package name.

Double tick around gpg maybe?

> +Install it as follows:
> +
> +.. code-block:: console
> +
> +   $ sudo apt install gpg
> +

apt-get

:D

> +Verify that your installation is successful by showing the version of GPG:
> +
> +.. code-block:: console
> +
> +   $ gpg --version
> +

What exactly does this depend on? Only the gpg binary or also libraries? 
It'd be nice to know because maybe other distros have different packages 
and need more/less. It seems that Debian's package installs the binary 
and depends on libgpg-error0 library.

Can be figured out later but it'd be nice.

> +Generating A Public And Private Key Pair With GPG
> +=================================================
> +
> +.. note::
> +
> +   This step is optional if you already have a pair of public and private keys.
> +
> +We need a pair of public and private keys for two independent tasks:
> +
> +-  Signing our sstate artifacts that the :term:`OpenEmbedded Build System`
> +   generates with our **private key**.
> +
> +-  Verifying our sstate artifacts with our **public key** when re-using them.
> +

You alternate between "we/us/our" and "you" and the use of the 
imperative mood ("Do this") throughout the document, it's a bit 
confusing. I think we've mostly use the second person and imperative 
mood so far, so maybe stick to that?

You also alternate between "sstate" and "shared state".

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
> +This will guide you through the steps of creating the key pair.
> +

s/This/It/

I initially was being confused why there was no step after "This will 
guide you" that would actually guide me through the steps :)

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
> +to configure our build.
> +
> +Configuring Our Build System To Sign Sstate Artifacts
> +=====================================================
> +
> +Shared State Location
> +---------------------
> +
> +Our build system needs to be configured to sign new sstate artifacts when they
> +are generated. The generation of new artifacts is done once a task has finished
> +being executed.
> +
> +For the following sections let's assume that our build system has the shared
> +state directory location (:term:`SSTATE_DIR`) defined as follows::
> +
> +   SSTATE_DIR = "${TOPDIR}/sstate-cache"
> +
> +Assuming this directory and our temporary directory (:term:`TMPDIR`) are empty,
> +as an example throughout this document, let's run the ``create_recipe_spdx``

What part of the sentence does "as an example throughout this document" 
apply to? The wording is awkward.

> +task of the ``gettext-minimal-native`` recipe:
> +
> +.. code-block:: console
> +
> +   $ bitbake gettext-minimal-native -c create_recipe_spdx
> +
> +After execution, our shared state directory should be populated with new files:
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
> +   The `siginfo` file is not related to GPG signing.
> +

But the first file also not since we haven't enabled signing yet, what 
did you want to say here?

> +Enabling Shared State Signing
> +-----------------------------
> +
> +Create a new :term:`configuration file` on your host **in a safe location** and

What makes a location safe?

I would suggest to put it somewhere in $HOME/.config/ maybe?

Since it contains a secret, we should probably also recommend to do

chmod o-rwx <file>

no (and possibly chown $USER:$USER <file> ?)

> +add the two following statements::
> +
> +   SSTATE_VERIFY_SIG = "1"
> +   SSTATE_SIG_KEY = "80613045069236143C2EE1A3C8855DA51F042B42"
> +   SSTATE_SIG_PASSPHRASE = "3lvJGHo8HZIcaufWFRezFIYRFDMSDmmkxOiwQ67PeM8IZre90I"
> +

Those (the key and the passphrase) don't match anything in this file, 
it'd be best to reuse what you've highlighted in the previous section.

For the passphrase, maybe mention to "for example use that passphrase" 
when generating the key (and adding a big fat warning to not actually 
use that passphrase), so we know this here refers to that there. Just a 
suggestion, maybe it's easier to not give an example than having to 
remind people not to reuse it.

> +It is advised to put these statements in a separate file as those contain
> +secrets and should not be shared. For this example, let's assume this file is
> +``conf/sstate-sig-key.conf``.
> +
> +These statements define:
> +
> +-  :term:`SSTATE_VERIFY_SIG`: setting this variable to "1" enables the shared
> +   state signing feature.
> +
> +-  :term:`SSTATE_SIG_KEY`: the GPG key identifier for signing shared state
> +   artifacts with the private key.
> +
> +   In our example, this corresponds to the identifier printed with the ``gpg
> +   --list-keys`` command :ref:`above <security-manual/sstate-signing:Generating
> +   A Public And Private Key Pair With GPG>`.
> +
> +-  :term:`SSTATE_SIG_PASSPHRASE`: the passphrase used to protect your private
> +   key when creating the key, chosen when creating the key pair.
> +

Am I the only bothered this is an option? Is there no way to use a 
keyring or the gpg-agent instead?

> +Let's test our configuration:
> +
> +#. Continuing with our ``gettext-minimal-native`` example, let's first clean the
> +   existing shared state artifacts:
> +
> +   .. code-block:: console
> +
> +      $ bitbake gettext-minimal-native -c cleansstate
> +

Why do we need to clean the cache (I'm assuming because you want to make 
sure the artifacts you sign are the one you just generated and not 
malicious ones, but I think it'd be worth explaining this is not a 
limitation but a design decision (IFF I really guessed that right)).

> +#. Run the ``create_recipe_spdx`` task for ``gettext-minimal-native``, but this
> +   time pass our new ``sstate-sig-key.conf`` file to :term:`BitBake`:
> +
> +   .. code-block:: console
> +
> +      $ bitbake -R conf/sstate-sig-key.conf gettext-minimal-native -c create_recipe_spdx
> +
> +List the files in the shared state directory again:
> +
> +.. code-block:: console
> +
> +   $ find sstate-cache/ -name "*gettext-minimal-native*create_recipe_spdx*"
> +   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-linux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf4978b2b3b617a_create_recipe_spdx.tar.zst
> +   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-linux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf4978b2b3b617a_create_recipe_spdx.tar.zst.sig
> +   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-linux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf4978b2b3b617a_create_recipe_spdx.tar.zst.siginfo
> +
> +A new ``.sig`` file was created: this means our artifact was successfully
> +signed, and the signature is stored in a separate ``.sig`` file.
> +
> +Verifying Signed Shared State Artifacts
> +=======================================
> +
> +Now that we have set up our build to sign shared state artifacts, let's see how
> +we can verify them with the public key counterpart of the private key.
> +
> +.. note::
> +
> +   Signature of shared state and its verification can happen on two different
> +   hosts, meaning one host can be in charge of the signature while another only
> +   verifies the artifacts. This is preferred as the private key should not be
> +   shared spread on multiple hosts.
> +

s/spread on/between/

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
> +   which we can accept shared state artifacts.
> +
> +   This means that shared state will be reused **only if it was signed with the
> +   private key corresponding to key identifier**.
> +
> +   You'll notice the short-form of the key identifier here, which are the last 16
> +   characters of the long-form key identifier shown with ``gpg --list-keys``:
> +
> +   .. parsed-literal::
> +
> +      pub   ed25519 2026-04-17 [SC]
> +            \4049A47E3AAA99D0250966DC\ **5B97632FA7F4E942**
> +      uid           [ultimate] Antonin Godard (SState Signing) <antonin.godard\@bootlin.com>
> +      sub   cv25519 2026-04-17 [E]
> +

See comment in the first occurrence of this parsed-literal.

> +Let's verify that signature verification works:
> +
> +#. First, remove temporary outputs (:term:`TMPDIR`) from the previous builds, to
> +   make the :term:`OpenEmbedded Build System` use the shared state:

make <OE> rebuild everything using the shared state

?

> +
> +   .. code-block:: console
> +
> +      $ rm -r $BUILDDIR/tmp/
> +

You never tell the user what this variable should be set to. If they 
forget, they'll wreak havoc on their host system deleting /tmp/ recursively.

> +#. Then, run the task again:
> +
> +   .. code-block:: console
> +
> +      $ bitbake gettext-minimal-native -c create_recipe_spdx
> +
> +#. To make sure the shared state artifact was successfully used, look for the
> +   :ref:`setscene <overview-manual/concepts:setscene tasks and shared state>` task
> +   for ``create_recipe_spdx`` in the latest log file from :term:`BitBake`:
> +
> +   .. code-block:: console
> +
> +      $ grep create_recipe_spdx_setscene tmp/log/cooker/<machine>/console-latest.log
> +      NOTE: Running setscene task 1 of 1 (../layers/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_create_recipe_spdx_setscene)
> +      NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
> +      NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
> +
> +   Our shared state was successfully verified and used!

Is there any indication in the logs that verification was actually 
performed?

> +
> +.. note::
> +
> +   To make sure shared state verification is working, you can set a "fake"
> +   public key identifier in :term:`SSTATE_VALID_SIGS`::
> +
> +      SSTATE_VALID_SIGS = "CAFECAFECAFECAFE"
> +
> +   Remove the temporary outputs again:
> +
> +   .. code-block:: console
> +
> +      $ rm -r $BUILDDIR/tmp/
> +
> +   Now, try executing the task:
> +
> +   .. code-block:: console
> +
> +      $ bitbake gettext-minimal-native -c create_recipe_spdx
> +
> +   You should have warnings from :term:`BitBake`:
> +

Is this output in the console or in the log file you mentioned earlier?

> +   .. code-block:: text
> +
> +      WARNING: gettext-minimal-native-1.0-r0 do_create_recipe_spdx_setscene: No accepted signatures found. Good signatures found: 5B97632FA7F4E942.
> +      WARNING: gettext-minimal-native-1.0-r0 do_create_recipe_spdx_setscene: Cannot verify signature on sstate package ../build/sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-linux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf4978b2b3b617a_create_recipe_spdx.tar.zst, skipping acceleration...
> +      WARNING: gettext-minimal-native-1.0-r0 do_create_recipe_spdx_setscene: No sstate archive obtainable, will run full task instead.
> +      WARNING: Logfile for failed setscene task is ../build/tmp/work/x86_64-linux/gettext-minimal-native/1.0/temp/log.do_create_recipe_spdx_setscene.6994
> +      WARNING: Setscene task (../layers/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_create_recipe_spdx_setscene) failed with exit code '1' - real task will be run instead
> +
> +   As you can see, this does not prevent :term:`BitBake` from continuing, but
> +   the real task is executed instead of re-using the shared state.
> 

Cheers,
Quentin

