Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EB6C4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 10:27:43 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.44])
 by mx.groups.io with SMTP id smtpd.web11.10018.1671186462025444595
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Dec 2022 02:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=a0R/XJ0x;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.249.44, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqkePD201FGLv75UX0BSzHP36dnEVWXKqCXME4otbG1Y7/ff4m9snP6CkrzbMY0xJx8UHtEzyjikIQ71QJzy5IaFzW3w12pBhKQ/BZVNULJ9WJwBQMZEm30Td0wRUqR8nz1n+O8/RyRjTjMQWYn67bWu3QFcREI8LtavOX4E+jf0oqTHlzq0PPiKM8MmIwRykh3w4XZvrfPW9B9Vtx0UuBSAWoZPWF6uWmSb6Cwm+S/hbC+NQf9IgZtEpRUyBNwUDKxzYQ5cPv2oVgLzppLH64P9wtL5mnVFa2ZRQWpYKwuUAAMmDJeSPSI4XrxlWbrk5j2A0oLFXWzIej+Wg1asxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FZ5waTE/uHsqUyfV5TluL8YYdHIuDmghbSNQymL3Yc=;
 b=FQnT1hr7YO56HNOZuTH49iJW3XfEsFvJ+n6jOy8kl2BteWvaHUlHicLgzlNwN+BuXAf+CKD0QQIhZY2gI3vk6Pnh3+LkbQ2aN5iFR7tQ418mauCxUJ+DuDhP50OxaCQsmMeywr7QESb9S4MrhU/+a4NCeZ16xK88J2CPHJeaQJK1iy2lrev2QVPc5W5k+YbWrT3xdT4sQ49VJ/mmc4u6nouZGBMBPWgwjvEeGR9RtEbaiFz67ipSXaqKXpvTY/k3SGu0yeHVU0twt70gFCMGEoC6eCBs37uO+PbM/+CeQ76EiqCsE5OfQw5gtJYQU78h1EWObgT5z/1sBj38//ylSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FZ5waTE/uHsqUyfV5TluL8YYdHIuDmghbSNQymL3Yc=;
 b=a0R/XJ0xZWk9QABVjnQUWyJBvDm9bkSV2lsabLZPoghPkU5Q1Q1rqztUk98Sdz/CgduVsAuM9KF7tF+iIKSStDaQyn2AtEpi7isc2xPQxnvDqhnbiQ0wPcbNjdDd14pCA1S7YVuyju3eOB8ftyoWNAYCk80YaPdm4EAQdAPUf+GbxTRsN7nJsc+fdYWqOKpfouVUZRjxbiHgUVaD6OlkI/gb1rEZdx6jnN3QRlafSt0mUkMPx5aINQxOv6gH2R4qbbWlEZuqdMgNa3trpnfRIWVEuh/OXb0sCy2RZ6yhzJpcA+JHHJfs0nHTGbOFFzjrUNdFv2Xtpr0XuE2UV8kzvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 10:27:37 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%7]) with mapi id 15.20.5880.019; Fri, 16 Dec 2022
 10:27:36 +0000
Message-ID: <ac6fa145-fea6-cb21-4558-38f93a42c13a@theobroma-systems.com>
Date: Fri, 16 Dec 2022 11:27:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [docs] [PATCH] manuals: prepare 4.2 migration notes
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20221216101232.356972-1-michael.opdenacker@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221216101232.356972-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::41) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|VE1PR04MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: ea1a47f4-f097-4f7c-4fdb-08dadf5026a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wTNhqksVe2THtGSGu3vTJgocp/gdaQDZFTb5Uvc2M4ys+ZMTQSdveIIBErafLRMis1UoNqcgVuMUuFMiRJ+4x5pUURIsWBL/6tSBPp8Jc+nd/LnRhNXe/zMRMDjslLprBEhpHZK89hFNCmwjAkfIrq8uhfMu7IlReeLY7ZUBOfV6DJmg5uCAisj3eBhElzGjmY8SYaFFSvGA3BlAj7+DA1n5wTd6foekh2J1libo7JXVYpuFEDGtoy75x0ZI1WL07c0sgEe0EVzkT5NAce+Dcsr+393UbpCT8hKa2uKoTg0IXkSKLkH1Ke1Jw3MpZ/GaXSAnBy3zeDQaQwQwe4hqoWT4wgK/FhwH0FE30FyYqf+05K3olytnEbOtEtVdARuk7M0fHP4Pnl5H+MlA6510LUVNWA/bIT8AOAmHFNJR6MZO+uTOcPdi5C578MMxrjpFzINubSdndq9ZsVY0vHWBI2Nyd0BbQrmJ66XK7fDaZPv/s9I84ZPzlCiYL6NTx4SI11FsiS/hXoVR1bj0cpmpBeI2NpfEqyLRjeR+2aAjwW4xx4Yevrwp42WEv8I1tAEkKGB8A1dg7BXSFcA3c7DxXtIMAyhCdAUBWIbGmXziwRSu5XuKsGtPZ1iSZzL223nFkE1qcV3Rh2Qsi6rsxW02d4APbPPRW8BrlheTYlmmSKJ9B8HrJVgAO2iaELOm8RWuDPQFBQ+iJg08jbvKPyuYbcctnn/Kusmz9mzETUC+48c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(366004)(39840400004)(451199015)(6512007)(53546011)(6506007)(2616005)(31686004)(36756003)(478600001)(6486002)(186003)(8936002)(38100700002)(86362001)(41300700001)(316002)(2906002)(66946007)(8676002)(66476007)(66556008)(44832011)(31696002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dXJuZEJoSmxRTkJpZzhDb0VXdXVsVjRkcThuVzRWYk4ySC9Mc2FZMndrQXR3?=
 =?utf-8?B?M0I1NTJGejcwTTg1ZU1pZnpjRTRjb1NTdU8rYm0vcnZoUjdUbzBSQVNRdS8w?=
 =?utf-8?B?RDdCaXdEQStDSi80RXJyTlQySXlibkgvdExJeE1sMEVqdHhyakM2OVRscUZY?=
 =?utf-8?B?Yi9nMUNSc05vVmsrNVQxSkhmc2J3U1NCdXBVQ2ZoTkJVQkExMzVzRThETTR6?=
 =?utf-8?B?QzNCVytDY0s0Q0xWazhwVHhaK0t1dVd3OHJUaXRLbm5KVlZwZUp1OXd6VWcw?=
 =?utf-8?B?OGpRbnFLYktjMFZjY3RPalNDNlVXTTFwMW01V1VQUm1XQVFhYmdSc1RrajRh?=
 =?utf-8?B?SG8xYU9nTXFaYzQ2Y0FseXptR01NTitWNzQycnRkU3ZTZHg5UFlrOGVZcHJv?=
 =?utf-8?B?WnlFM0hpeXpFaVVSMHdrUS9heThWTjBQN1RJUzJrUitJUEFmSWVUellGclJw?=
 =?utf-8?B?aUxKbmdpZmVxSVczM3pSK28rK3d4TmtGaDVMQjBLQkVaVU5yN2U5Z2NiWTc4?=
 =?utf-8?B?aFJsbkt2WUZ0ZVBhNlRGdllULzBKd2FpdHNCOXBEdW5PdVJWS1RXOGY0UXBL?=
 =?utf-8?B?ekRaY3dYSE1jdmdSRjU1clI0bWtiaEVIYnJTa2JpSnJnbjE2WEg1L0lmZXEv?=
 =?utf-8?B?cGY1bkM3dGxzKzZUMTNya0tvQURVMTVIbG5OcVBtVlp3cEg2aHJQd210aHlh?=
 =?utf-8?B?SXdISGh0d3V1TTM2V3RrTnRNL0hVUzFLMWxna2lSVW1Lb2ZPdW5NN3J3WWF5?=
 =?utf-8?B?eFZINGM1Y1pmMWUzS01wV3BzcHhtZFk5SHhqLy9CMDI1N1VTM0RZK25TZ3M1?=
 =?utf-8?B?L1JUaVFyTXphaFg1ZmpOTnBUU2kwTWNGQmRQTURtdmQ5VHNmOTlHNWIwejVV?=
 =?utf-8?B?dWRia3E2d1AycFIxVk9hUW1ZakxWSnhDRTI1MnhrbDJQMmxtVk00WXM1SE9U?=
 =?utf-8?B?cGljZDY2TWkwRXoxQzB5by9qZVlldjRFbVIrS01BUHNRdGxreEVsWGFzdnZM?=
 =?utf-8?B?RHYvSUxYZkxMendydHpMN00vZDFHdjRsVjlwNzYvblJ4WmFFdGppY29IUFpO?=
 =?utf-8?B?MG14dXROcVlwM3hFYVJDbXp3aDVIZnhpWWNrL2RRTlFFYUY2UTVDL0NaWmt2?=
 =?utf-8?B?V25FMmFuTVlTcW4vN3VyTm9KMlYyZUZSYy9ZZCtScEdBOWFkSmlsdkY4TUZs?=
 =?utf-8?B?MXFENE4wTEUrMldDOVhiaWlDYmdBWTMrMTEyb0Y4djZGSmtvdFgydC9XNFNT?=
 =?utf-8?B?bk11U1pKNURmaFpBR3lIOWNLVlBCU0RtdE9ienF3ZXFKKzZ4Q0hTVkUvMitI?=
 =?utf-8?B?RzBtMnBxOFFvU2hzSTRaSG9OVWhOTkY3ZkV5OHpob2hLK3IyTjk1MVZwdXpt?=
 =?utf-8?B?eWpJWk4vUVQ3R0lJc0dsQmhpYXRuMG42azJzM2E5d0NNamRNNStOeStBTUYy?=
 =?utf-8?B?cStYY1FZemZqN3BYVk9vaDA0a3MxdURMdUZnM2l2cUxEaXlobFk5aEF2MERw?=
 =?utf-8?B?dHhhMi9QUVQ5dTV6Q2ZiK0RaclAydHphUDBIOVlhYWxEeUZOdTFhS2tEUTkv?=
 =?utf-8?B?U09sYWhPa2dsc1BxZU5reDZHWUZUNm1BTDdCREkrd2VVeURXQUxGWXlBRWcx?=
 =?utf-8?B?QmQrNUpXYjhhWmFwNjVQUGJIS2R6YlpvMkRpcGxqVk04S204ZjNGbzh6c3ZQ?=
 =?utf-8?B?QUwwU0dKM3I0QkU0dDBrNHF2c2dhU0NOdUhLZWdNMXBNcThVb0NyNE5tZDU1?=
 =?utf-8?B?bzZjVExvZWJ0NEpNbWtidzhpemRkVDBLUkhyS0hBOU51Yi9GWTRJSDgvZWww?=
 =?utf-8?B?d3NEOHB6L0NrNmlWdStLSXYyQ25nWmRGNGJqNW9zeTd3SUIrUXREaVViQ2hD?=
 =?utf-8?B?YmxDYVBrNjAxSmptNFFUQS9uR095aXo0ZkRnT2JTcU4zbGwwU21XN2JwMkhq?=
 =?utf-8?B?VkZINDJoSjJNRWFNcEZlK1BBWVNRbUczVkRLbnJUejZGL0x2Q3Q5eGs4TDJD?=
 =?utf-8?B?ZUJvZHRST2ZSUWYrNnNFNloxNFpBVHY5L1QvZkVkVGtaUjAzZm1qM0UyRCtD?=
 =?utf-8?B?S01zdW41U1U4K3ROeWVVbXJGcTQ1aitNdHdyc2tDR3V0Y3F6SHBOdWFGR1V1?=
 =?utf-8?B?clAzMzc1RnczTWtScldLYXpIOEhMOG54REpUMExHTGlqb3EvQ01jdUgyZ0tP?=
 =?utf-8?B?M04rS3lYbzVKbkVxTXFYM2REMTZVSFJqVlgrUnN3M1dwZGF6eVc3RXo5RWQr?=
 =?utf-8?B?NDlDVnROZExvTTJWUEx3cE5PUjFRPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1a47f4-f097-4f7c-4fdb-08dadf5026a9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 10:27:36.7229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUA872Kl8HGSbEiViRpZWxQNDC+8M+Li43IkBpQNcrAjrhzqcdR8tog8Sgp5hFfzDtqzMPpYLqmP4Obu56/Ttf9psEmVPWaCeAhs5mZfM8AsCqJ7vR9k9UWVHnkKbjsm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 16 Dec 2022 10:27:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3558

Hi Michael,

On 12/16/22 11:12, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/migration-guides/index.rst      |  1 +
>   .../migration-guides/migration-4.2.rst        | 48 +++++++++++++++++++
>   .../migration-guides/release-4.2.rst          |  9 ++++
>   .../migration-guides/release-notes-4.2.rst    | 28 +++++++++++
>   4 files changed, 86 insertions(+)
>   create mode 100644 documentation/migration-guides/migration-4.2.rst
>   create mode 100644 documentation/migration-guides/release-4.2.rst
>   create mode 100644 documentation/migration-guides/release-notes-4.2.rst
> 
> diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
> index ce0ca8c659..6f7bcbef29 100644
> --- a/documentation/migration-guides/index.rst
> +++ b/documentation/migration-guides/index.rst
> @@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the previous one.
>   .. toctree::
>   
>      migration-general
> +   release-4.2
>      release-4.1
>      release-4.0
>      release-3.4
> diff --git a/documentation/migration-guides/migration-4.2.rst b/documentation/migration-guides/migration-4.2.rst
> new file mode 100644
> index 0000000000..944ad31a4c
> --- /dev/null
> +++ b/documentation/migration-guides/migration-4.2.rst
> @@ -0,0 +1,48 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Release 4.2 (mickledore)
> +========================
> +
> +Migration notes for 4.2 (mickledore)
> +------------------------------------
> +
> +This section provides migration information for moving to the Yocto
> +Project 4.2 Release (codename "mickledore") from the prior release.
> +
> +.. _migration-4.2-python-3.8:
> +
> +Python 3.8 is now the minimum required Python version version
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~------------
> +
> +BitBake and OpenEmbedded-Core are now relying on Python 3.8,
> +making it a requirement to use a distribution providing at least this
> +version, or to use :term:`buildtools`.
> +
> +.. _migration-4.2-qa-checks:
> +
> +QA check changes
> +~~~~~~~~~~~~~~~~
> +
> +.. _migration-4.2-misc-changes:
> +
> +Miscellaneous changes
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +- The ``OEBasic`` signature handler (see :term:`BB_SIGNATURE_HANDLER`) has been
> +  removed.
> +
> +.. _migration-4.2-removed-variables:
> +
> +Removed variables
> +~~~~~~~~~~~~~~~~~
> +
> +The following variables have been removed:
> +- ``SERIAL_CONSOLE``, deprecated since version 2.6, replaced by :term:``SERIAL_CONSOLES``.
> +
> +.. _migration-4.2-removed-recipes:
> +
> +Removed recipes
> +~~~~~~~~~~~~~~~
> +
> +The following recipes have been removed in this release:
> +
> diff --git a/documentation/migration-guides/release-4.2.rst b/documentation/migration-guides/release-4.2.rst
> new file mode 100644
> index 0000000000..ae52d939c8
> --- /dev/null
> +++ b/documentation/migration-guides/release-4.2.rst
> @@ -0,0 +1,9 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Release 4.2 (mickledore)
> +========================
> +
> +.. toctree::
> +
> +   migration-4.2
> +   release-notes-4.2
> diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
> new file mode 100644
> index 0000000000..f3d69d98cc
> --- /dev/null
> +++ b/documentation/migration-guides/release-notes-4.2.rst
> @@ -0,0 +1,28 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Release notes for 4.2 (mickledore)
> +---------------------------------
> +
> +New Features / Enhancements in 4.2
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +- Python 3.8 s the minimum Python version required on the build host.

s/s/is/

> +  For host distros that do not provide it, this is included as part of the

s/distros/distributions/

> +  :term:`buildtools` tarball.
> +
> +- This release now supports a new ``addpylib`` directive to enable
> +  Python libraries within layers.
> +

I think it's worth saying a few more words here if we don't already have 
some explanations elsewhere in the docs.

When should I use this?

IIRC, it's when you want to use some function in some configuration file 
(where one cannot define functions?) or put things in common in recipes 
without using a class to define this new function. Is there another 
usecase I haven't thought about?

Anyways, this can be improved over time :)

Cheers,
Quentin

