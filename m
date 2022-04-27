Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79510C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 12:51:10 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.83])
 by mx.groups.io with SMTP id smtpd.web09.7699.1651063862859067093
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 05:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=s6cGw6hi;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.83,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnhKdS9Ro08M4DJ2IaUMkKjePO7SnkTCsEzT7cILfefcKuZwJ0YBmur8xY4fR7ch9YbHMrOIS5LJKXbFrxTEg4kzUgGaJLmcr5Baez4Jh9qcYLqjC1mbv9MaMfJ8Cu2vKtfNxa9r0cOmxo0GfQHL3gjEzW0lXgE3b4lZ2fgYCjf0EvivxkrB4LzZEqmZRmzwsx6As6uBMosriAp+KPUz8h10hWx42h4WlgQy7T9BxjEMVxmdCZ1FKPj3wq2V3wlZnSFw8RmRIp7eRxI1pzLb/JqHckYkqxz/QZuChjmrd0fbwu+GYmYdh2E4WXX0oRg6lg4YLR/6vnkMUUmBm36h3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dO6Soakm5UDlsFZz4SqCZ2v+28iIvA61zz+MZQD+tQ=;
 b=MRGWfAlLGhLFVC/Q63YHiLBp0qNOJGLm53BwC3Ivi9ME4H9i1uFe3BM12nZg/CJY3Ihf/91j6fBPLJ4lLxu+dpQe0mdrrVkcLClR77pehoJbq+rwuXAy1XHPJOAR98EUwMATszN+8DrvniAVEydNVZbE2vo+5j5HCBbaV61wVAqR1ow2FI3MUKwcwzNyGCpHwXM5fivO/G6kSyRRfbD0fP2klE8lEG7WHMvmFX0/htxq+ScVYtUlroDATwr4tYfmMwTrIM49YaukZjVH6yQT7k2MrRu3e2rRDJVCkfEEp8Iqpkr+HeVH9MBJRdJfusr1GGQoPWGFonbrKwzHOZeRrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dO6Soakm5UDlsFZz4SqCZ2v+28iIvA61zz+MZQD+tQ=;
 b=s6cGw6hi/KZYjJT4OhWdnyDzUp6CptBgBtLZNGpSQjIOfMrCGHbo9ffEflsQhFIBzquv4vvHJodCat2Qbv4yB8HdaT+HpFJLY9kFaYl2WtlX+UDQd+H0SPqy/DT99HqP/maM8OQ/Q6IEqJXpr+s7cpUb00tyQNP53y6mkep8pF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AS8PR04MB8705.eurprd04.prod.outlook.com (2603:10a6:20b:428::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 12:50:59 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979%4]) with mapi id 15.20.5186.014; Wed, 27 Apr 2022
 12:50:59 +0000
Message-ID: <b3764592-5af0-6ae0-baf9-31c7df5427aa@theobroma-systems.com>
Date: Wed, 27 Apr 2022 14:50:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [docs] [PATCH] migration-guides: stop including documents with
 ".. include"
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Cc: yocto@lists.yoctoproject.org,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <16E9C0CE66240BBD.28362@lists.yoctoproject.org>
 <20220427123341.228526-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220427123341.228526-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::23) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 038de6a5-8966-48ae-b872-08da284c9346
X-MS-TrafficTypeDiagnostic: AS8PR04MB8705:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR04MB8705795895A3438E73D1F806C2FA9@AS8PR04MB8705.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ceIRWNXA9H5qGjyG+h5FOGnSLnuYvyXKpCDJ1vfN1Mop3vd9qyxop78DRpoKYUJT/Xo/plI12T+l9yiyWVellI7SinSIKMnocOf53YpJQf0+GjlObRH4pUI7D5G546Y9jHjSSdjH7KJwfGVzKb1JsfgeDF1/bHfqzVALwhWZOPPGSTBqRxIgNf0ogAkdYb/M1GdvDvAkmum3yrhGJeL+RWXPahexaQBWSmODrXkol+b6gxASlhbJCI6tu1/xJ3xw8/cV1BSO9ri1xwQN2clWAA3EcxYCkQFeksA0Sj/+1PfmNyQAyfNPT1g9tVnJzBxOVH86sq2Jy71tJWYOJAAnpLjgrjn7S5icqT+17CCXIIO8tQY1AdESotgLcPBi2EH70nPiCi/2bTVEobEPS4KhRXUbzVvsigeyEwIcLILpAJJANcJfqhqeI084WGrAbfgJHv2xgthM9NtysJl2tU0vzrbbfENa+Kpfu5C/9yAT7z+1o+c05gr8YWN5qAP24ElxwEw/amgKF2fnFHzJieREHtFxf6AFh/zI0jt5AsoXNRKWqTM2keUY5R+9Di+QfS4Orv5xphzzgaLsmpSYVyKWlh28HctchO/oMyKzbkPCpq2BPpwU2jRhclYpn9sGtbFqPXm2LTigAz4+dqdv6es6sF0JTnxaERR1VCFyo6xYHRH3GajIkbky8AmFt3aUrDiQHbspcv9/LExZgvmNI7XtTLEmvYKyg2g1z6560KmcOeZi6be2Ou0VhGddo91pj6ajNtEWK3HlepWbvsGpGluOpbB20nIcLC3YdiHhgPl/Yw15Xl9YIr8pEhffHquAi5LOts5lq7baD2qIwfDVIy8w9gRHJwJSkvzEwPlNXgmz3H4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(966005)(6486002)(508600001)(2616005)(31696002)(86362001)(6512007)(53546011)(26005)(6506007)(6666004)(38100700002)(186003)(66476007)(316002)(2906002)(66946007)(66556008)(36756003)(5660300002)(44832011)(8936002)(31686004)(4326008)(83380400001)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MW1sWFNURy9BNERpVGlJWkJ6WEh5ejFuU1J1QWdDbUJaZlJaRUw5ektjaDdw?=
 =?utf-8?B?N2o3T0o2VnZWQ0FuVVdTWDF1cFhzQmUwNDYvRmx4SkVZQ2xockVmNjd5RWtV?=
 =?utf-8?B?VnByT1ByL0l4ZUZzQVVQZnlhdVZ1eFVnZ3J5QkN6dFlnckZQTnVkY3NHamFO?=
 =?utf-8?B?VWFYS2F3RHhBelIzQWlQWmY0cTJHd2xQVjdBczFYUXJ0b1l3ejFGbXlBc1NS?=
 =?utf-8?B?SUFmQmhhWG9Fa1pSRnJqcWY1UlVVam5jZWNtUktoSStYaHUvQVhZTVFmc3JU?=
 =?utf-8?B?SE1zdG5IRUNFTzhJUnNqK1VFK1ZuZktrTU5KeGpMQVhaa0ZpMzVMcDUzNFpD?=
 =?utf-8?B?ckt0c1c5Y3lzT3QrdVhTd3JMUnk4TDJ0V3BUeElDZldVNEVYekVoREFGR0RD?=
 =?utf-8?B?SHNKM0R3Q0ZJZUxNaGVSM3BYSkZXaDhUNytmbjZxdE1nVGhYQmhYdkVQWDl3?=
 =?utf-8?B?ZTZISkRMcGpxNEVPU0lhekYweFdDeFpLMFgzNFBEOUJIOHN6S1d2TGQ3Z29z?=
 =?utf-8?B?OGhJc2hXRElJS2V1dTlPUGdDTXd3dGgveWhGZUdiUFJtd2JPa1pTdmNpZCt3?=
 =?utf-8?B?ZVo2cSs3ZjlqV0NXL3JwMklLTjFyTEx3dElMV3VSeVRIbG9TTnZIYS9DUVpH?=
 =?utf-8?B?c2NpamMxRmJ2T3cvUjFYOFJUckNvOTRxRlQ5cFZUMUxCb3FBR0h5bDVPcXZ5?=
 =?utf-8?B?L1ZiSDk1bzNoM2lvdWFodXRRMDQwYi82aDZhaERDWDRLcGVVRzMzUi9QS000?=
 =?utf-8?B?U2h2OVNHZkk1Vkt1clhjekZiTUc3L3U3TW5LTDBXWEFsWTJhTEZ1bmJYZHRu?=
 =?utf-8?B?d3FkUExrNVF2QThSZmpmWm1CeHdweVpxV1UxY3pTUm0rejhBQTNTZHEzc2tH?=
 =?utf-8?B?RnEvLzMyMmVaKzg2akQ5cHN4Si9JdnVDUzdpaEJFcVdpaWw3dEF1SDRDMXlU?=
 =?utf-8?B?K2xJei8xK2cvZy8rWmZZaDRBdHdySHkzSEVkWGFrTURtZG1HcUhrRFF5U21s?=
 =?utf-8?B?OVBLdi9aMDRReVpYU0VJem5kY0Q2dU5TejR0Qlo4Nm85TDY3UG0xNlBKbmpT?=
 =?utf-8?B?SHpGdElYRmlkQ0xsNjdLVXNESzNWOWxNNHdhNUc2ckZHOWFlaDdiZDVrSEh2?=
 =?utf-8?B?YnZmOG94L3ErcitHTVVpeUdwalBKaGJlemNFcjNLUVp4NC92L21zZVFyNVRx?=
 =?utf-8?B?bEtHNDNjVExGSC9nbDNZa2t6TFRaSkNzS1dxdklaWXJZRW43OXVhRUd2M0Vv?=
 =?utf-8?B?V2NXREowc3VWcktTRGFzcTFjenB0QXJEcHg2Wk8rVG9vZ0lyMFBkV1JKZTRo?=
 =?utf-8?B?QjdYVC8vQ0pFODBDNXk1MCtMdnJBaXFWNnloMTdRTHVWckhUWVNQaytrTmtv?=
 =?utf-8?B?SkpEV2VLaTE5STFCL2YvbXQxNVdlb0x4eEk0K3o0QlVQZDQ5Z2tYa2ZDVXh2?=
 =?utf-8?B?S1lNcTNvRE9jaHRDYWJUUWZBWDl1L3hnTWdpMElGdWZ2VitZakY1eklaSG1B?=
 =?utf-8?B?MVZDMnpUelIyWnhJWTFBSDNxZmRNbEhWR3pMZXJJRUhqQ29RdTg5Q3NyUmlI?=
 =?utf-8?B?UHZjTy9tRlh3OFJtdHUvYW4rMmlWelZxMHAvTDdtME5nSTlUOTd0UlppOHdw?=
 =?utf-8?B?MFFVQVNzUS9CRGVmQTFwYS9qK2k0MjlQTEVNcG1LdCtydTdMWlFNb0dDdTZy?=
 =?utf-8?B?SGV3SVJKM2tyRmRiTktieTB2NmJCd1pDWW1Tc1FyU3lITmZaNGI3ZUttbHo1?=
 =?utf-8?B?anEzbTN2Ly83eUwyR1IvcHFxS1Zzdzd5VFdja2dhU2ZhcS92dCt4ZzJ2enpD?=
 =?utf-8?B?YU54Ylk3N1cvNE1BUmIvQ1VTMlRCV3BZRTZ0NWVVYTJrR21ZNE5JUGVkWEtj?=
 =?utf-8?B?a0M4RGVBakVCUGMrVnRrZE0yT3NkempyMmlCaUNUQTlKL3FKSmNQZHBleTRu?=
 =?utf-8?B?SW9FUUlrbDkwMUp1NXdjNy9rZFAzYTBZM1FPMjUwVTgvcERxbnEyaUdXcTBq?=
 =?utf-8?B?K2NqZXhqR0I2T3lPSXpLREZOK3BMeUErSk9SbSsyd0ZmV2dJc0UrMm9CVXBU?=
 =?utf-8?B?Znl0Z0Z6NEdLeFErb0hkM1ZkcllJZFhKc2srMytPb0RBV3ZHSy9nRkQxVGRp?=
 =?utf-8?B?M0doc3BlUkdEUkl4ZCtYa2V5L1gvWlFYenBsenBsOGIyY1ZzY05BQ2lWM0Zm?=
 =?utf-8?B?T2ZzdHZ3RkRUM1VrdG0xemljakw5eVJUVDNJcUUzOHlXMlhWLzJRTVBMcENk?=
 =?utf-8?B?d2p2d0NISHllWk1BbDVnSUFFZTRPbnFVLys0alZuWnNIdDI0eFZtK1BLa2k5?=
 =?utf-8?B?Q1o5SWdKdUM5aC9iQzZTK2NYN3ZJUFE3NVlqMU1vM245MC9OVGxRWUVDaDls?=
 =?utf-8?Q?hfQos8E0+5JaQP8Evzu6Z6S/pEFMK+MPbbbXm?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 038de6a5-8966-48ae-b872-08da284c9346
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 12:50:59.1743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CfkteorAtGQLOBRJotYNcA3aZEvI7A/sFAF4rIzvKepHP6SGu4Bby4n2O5S6Ojvi/yM0tzrA2Wlo/hGrEvgPAoxKB5xV91ZXhZvuiKlPzChLnoxNX7rIxROmllA0WqH9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8705
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 12:51:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2890

Hi Michael,

On 4/27/22 14:33, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 

Technically incorrect, it's Nicolas who's the author :)

git commit --author="Nicolas Dechesne <nicolas.dechesne@linaro.org>"

is the line to specify an author.

> This prevented variables from being substituted through the
> code in yocto-vars.py, at least in the files included this way.
> 

I checked and the file actually gets passed to subst_vars_replace 
function and the output of that is correct. However, it does not make it 
to the output of the file where it is included. I cannot explain why 
without digging deep into Sphinx code. I think we might be able to use 
https://www.sphinx-doc.org/en/master/extdev/appapi.html#event-html-page-context 
instead, but haven't looked into it yet and does not seem like a clean 
way to do it (patching the html after rendering).

I think a proper bug report should be filed to Sphinx though.

Cheers,
Quentin

> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>   documentation/migration-guides/index.rst         |  4 ++--
>   documentation/migration-guides/migration-3.4.rst |  6 ------
>   documentation/migration-guides/migration-4.0.rst |  2 --
>   documentation/migration-guides/release-3.4.rst   | 10 ++++++++++
>   documentation/migration-guides/release-4.0.rst   |  7 +++++++
>   5 files changed, 19 insertions(+), 10 deletions(-)
>   create mode 100644 documentation/migration-guides/release-3.4.rst
>   create mode 100644 documentation/migration-guides/release-4.0.rst
> 
> diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
> index 20c6ab9d4e..4597506d05 100644
> --- a/documentation/migration-guides/index.rst
> +++ b/documentation/migration-guides/index.rst
> @@ -12,8 +12,8 @@ to move to one release of the Yocto Project from the previous one.
>   .. toctree::
>   
>      migration-general
> -   migration-4.0
> -   migration-3.4
> +   release-4.0
> +   release-3.4
>      migration-3.3
>      migration-3.2
>      migration-3.1
> diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
> index c22ea814d6..d57c955eb4 100644
> --- a/documentation/migration-guides/migration-3.4.rst
> +++ b/documentation/migration-guides/migration-3.4.rst
> @@ -1,6 +1,3 @@
> -Release 3.4 (honister)
> -======================
> -
>   Migration notes for 3.4 (honister)
>   ----------------------------------
>   
> @@ -274,6 +271,3 @@ Miscellaneous
>     examples in :term:`EXTRA_USERS_PARAMS`.
>   
>   
> -.. include:: release-notes-3.4.rst
> -.. include:: release-notes-3.4.1.rst
> -.. include:: release-notes-3.4.2.rst
> diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
> index d737b9d431..a8e6b4c331 100644
> --- a/documentation/migration-guides/migration-4.0.rst
> +++ b/documentation/migration-guides/migration-4.0.rst
> @@ -265,5 +265,3 @@ Miscellaneous changes
>     when parsing recipes. Any code depending on the previous behaviour will no longer
>     work - change any such code to explicitly use appropriate path variables instead.
>   
> -
> -.. include:: release-notes-4.0.rst
> diff --git a/documentation/migration-guides/release-3.4.rst b/documentation/migration-guides/release-3.4.rst
> new file mode 100644
> index 0000000000..81476c4adb
> --- /dev/null
> +++ b/documentation/migration-guides/release-3.4.rst
> @@ -0,0 +1,10 @@
> +Release 3.4 (honister)
> +======================
> +
> +.. toctree::
> +
> +   migration-3.4
> +   release-notes-3.4
> +   release-notes-3.4.1
> +   release-notes-3.4.2
> +
> diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
> new file mode 100644
> index 0000000000..7062f9d241
> --- /dev/null
> +++ b/documentation/migration-guides/release-4.0.rst
> @@ -0,0 +1,7 @@
> +Release 4.0 (kirkstone)
> +=======================
> +
> +.. toctree::
> +
> +   migration-4.0
> +   release-notes-4.0
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2888): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_message_2888&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=J4eIkh9QTwUi1NxoblYJOF6xn9h0aaqhTVBvprxNSQEJ_stG384-Hja2686EHoKk&s=4QOct9PCl-tLB0LFUEZolfPU69tOIaZpx8auklwp1TQ&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_mt_90729285_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=J4eIkh9QTwUi1NxoblYJOF6xn9h0aaqhTVBvprxNSQEJ_stG384-Hja2686EHoKk&s=GygZULWf1tp9XuuuPTuK82vj9HWlK1kPSccs2NdIx_Q&e=
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=J4eIkh9QTwUi1NxoblYJOF6xn9h0aaqhTVBvprxNSQEJ_stG384-Hja2686EHoKk&s=WGN6DdGkiKQXm_ekuEMgilEOs3D4YAU7uIcJZYjTnjk&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

