Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D8DC48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 16:13:02 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.110])
 by mx.groups.io with SMTP id smtpd.web11.45234.1708359172648877435
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Feb 2024 08:12:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=aF8vzwuL;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.110, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayQbbBaXB1NGXgw4BPF1oZdeDUbLzwI8Cu59r7Z8cdAfOiDLXdK7HJG07QYPdZ0lO6UdTmucqXMfVqIY2eCyE8Wt9oRN0Wj+Vq8KGT+26JCOIwdL1myFnKiqqS0+7e8+N2wt1AHC2nAii45qXoofhY9o5J3AIQOxa2ZG448KX/GsG7TIsy5It+8CDT2dZqh6pBVrxkvM7HU6FSIy21DQt7p46gkuZ0d2wuU1Gyhi9Zw0LKhVKC3utNO7g1EFXy8jOubm4N+JeuDxR2muRJqxwqgol9NupbgDjczTFVRfZ6hKin48oxdALPQ3g2esjLHNGeoqKKJyE/9/plrdOo2Ixg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6Ci7ZoPxWUPRtUHUTyQOveUB6CiscCO0JaPD7/1MAY=;
 b=XISG9Lj7iA/B2FTeXfHhp9BOu35qoXrJULN7DrNnupurszlvi1go+LxJ1FMl4R8tW63YjoUkO2AkQtsxGV37sOGolGqKMvtwgQ77Jx6KUaJO9JXrw4UcTKZ2vim1MYwt2SN0xB03TrObwzOok6LilASTwt4HvkQuQ/SS54MYaJXVW+RMeApAOxcrCgl3znjPBVRBgBgCcbK4smWv7LL+bBDydqpeJREA3SluK63f/a0N3vtlbor/tvgRKgtz3xuS3jLFos8vqkME+9cJ+M6FfyIr4pkeCnx/HBI6AKlvq44couWRqTFtE4JfdAV10ffcUD7FPFqXRAzKqZ8DrPuufQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6Ci7ZoPxWUPRtUHUTyQOveUB6CiscCO0JaPD7/1MAY=;
 b=aF8vzwuLmb5aVm+9UENGW/B/R/zft2l7Udvbi8EKiXUw+pLtd4zajCWSqqTuO5uyik2IGbOQoDkpeHv2swvg8WSD4ptE/0O39zs43qwFcIekb+AVhMnIxhdxGkQmrHS2pFmRCfsEn3o03Nfxds0vajv08n1h6/yaDKCeAxp7ZpKyU0yJx1MRiot2xe7DAoCkHYVQr4XmiyqfKXEesED1/tI1YKJFyweL4ScwziJJPSOVFgj6U9fsd9l636mPu/6ujbdMPYoXQp/iYt9/BPFr8DlMYvfVUy+xz+g65ZpCGQxk0If37qonr9+jfVb9DMNgHXoq46evGwMFYvvFAPUkKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PA4PR04MB7695.eurprd04.prod.outlook.com (2603:10a6:102:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Mon, 19 Feb
 2024 16:12:48 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::550d:ad96:e3cb:9a6e]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::550d:ad96:e3cb:9a6e%5]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 16:12:48 +0000
Message-ID: <d7177c8d-756e-41ab-95aa-6e7b8ccb591b@theobroma-systems.com>
Date: Mon, 19 Feb 2024 17:12:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: tasks: do_cleanall: mention it is not
 allowed with a shared DL_DIR
Content-Language: en-US
To: luca.ceresoli@bootlin.com, docs@lists.yoctoproject.org
References: <20240219155513.76738-1-luca.ceresoli@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240219155513.76738-1-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::9) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PA4PR04MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: b5d2a451-1fc4-43d5-a447-08dc31659d36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wW/HsUXmflUJpczirJfsmI9o0RP1VvVNwr8lW/LO00P2eixFcCcDUtHg9/kNdTr0v3cWLAMjB0NYdCaIJ5d2SgBnSaUFoOYwoxD1cI+bdfnk5mU3lVR7hgtEuWJpXXxBkvnFz+vXLNYWdzTJpNhbrh/bOycr+hIAPzKrEybpqwDZY5KLROkqZ2Ecjc6vkZ6mmWP1vtblGq9/RLRWjT59bohfcNHNsvja7SuToglwdq7UJ4iKsT261pSrJ8ArEOOgfDAMQYW71CRTlr8TltzA9jUlcKawbU2KN5iaetkjGB8tpW0wamcm38Vn7bBebr4Fc5W/ZN5hEc0zZO1G84rxZe6vDmjcMy2EOJQWU0p1+WWrOj1yN1KWl5JMm12Gh05gXjZ7y7RtUBw9+1C8d+7JHE8dPNFRH/S7M1VgoEk2VC7pBCitvjgDXcD016uADpkHnixqycfbFZMLYZdvMbpa5pqXZORCZpHp3q8kdXdbpRXE4dqbXb2JxmOSBpKaRFXIyPQjaiJSoMvrx5feGWoA+S8szqCv1GaGQ3PdwrYPdPS3Anr8ToBScY6trYGSKbV6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(230473577357003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cGxrNSt3UW1TazYvUVN2Ly9hb0JYaXY2RFJEMFZEUlFUSmNpVTh4Tzl2RkZS?=
 =?utf-8?B?ZHErUTlEc21pbWtHeGphUWxHN3M2eWRVL0NoY1ZpUXFSUDh6ckFjR0dzU0t2?=
 =?utf-8?B?TUJaV0NldmYrNitvZGljbzNjaEliYzg2MjZ3UWprakhTRUwzRkFGcE1HaHIx?=
 =?utf-8?B?SGpJcFNCUkk2eDFUUCtXdWE0TkhTMEVCdHlpcnJxRTFWUGFPLzFydVFxWWRs?=
 =?utf-8?B?MGpkT3pXNmFUUjBPU3ZDb0Q0R0RKSUhpWWgzQmNhczEzNFB4SUxUUlliUGt6?=
 =?utf-8?B?SWp1THhEMGNQb2xCdUlLY3RiQ3VVUUEwT2RaOERrTktFdXIzN1hqUTlMVmMx?=
 =?utf-8?B?L0FYajhwT2pqZGFjY3pSTlB1eWZkbTB5NVZQeWtVZUlLbmVTaHpralZmOXEw?=
 =?utf-8?B?SWxPc1h4cDBIdDlBUmh1T3JzUzdHNWN2bnRjOFJGRFdzNjJ3OEdqNHVHWkwz?=
 =?utf-8?B?RUdMdlovaW5ndEM1dlRrdCtCWVZZeHoyYnFselZYQUJIRVFDckZPc0hoaktZ?=
 =?utf-8?B?a1kvQkJ2ZnpQS25kQVdVTEdiODMzQi92ZjdSN3ZwNTgxQ1liVWljVWJsUy9E?=
 =?utf-8?B?aVNrUXkyRWQ5QWZWb09ZZzhvNThCaytZOGtjVFgzQ3MvVVo4NExYS1hHdG4y?=
 =?utf-8?B?d201YTZoZThBcWFMZzJRT2dxYzFhb0hpS1U1cVBsc2gvekRWa2JsSTRkYUh6?=
 =?utf-8?B?V0w0MG1pRkNNSDhLYWVMYzhTSlZpNUl5WVVrSmNNQ0JLZitHWGdEVzdSWVVo?=
 =?utf-8?B?Zmk2Q0RUS28wRWhPNkdFZHZFUy9LMVpXUWxCMEk0dS9YU21TZkxnUzVaandS?=
 =?utf-8?B?K0g5VU5SMHJFSTRnNTlQdGgrSURjZ3JVODUwdmFzVGllUlFWdG1tK3R3WnVM?=
 =?utf-8?B?bHh0REVpTW9vWDFKSG85d2QzakkyNzVEME96QkhzdFBVd3h5NWtIN09Bd3NL?=
 =?utf-8?B?aDBxb3VqNUM4WkJkQXdmWWpraGRVQWV6YWJTNDdKa0xoWit3aC9KaWJlR2dQ?=
 =?utf-8?B?TU5VeGd0QllLU1hPWkdKVDdXWFJ6SHFSRFNqSFV2WTlIOVZwVTZGbGZlUXpH?=
 =?utf-8?B?eThlSWhnVnlnS1FpQ29hcG5YOS9SV3k2emtZdGwyTDllYUZ1V3BOY1pYWjNK?=
 =?utf-8?B?ZTkvSUNVZkV1aU5FRFRuU2xsSHcvUUp4TWRheHN2YkdZRlNVZTdBc0tpMlFW?=
 =?utf-8?B?bjBkU0tBNGJsY0hHeXExbzRFRDZMTDc5UEJLYVZjOVVadS9MTlFCcGdKNzRY?=
 =?utf-8?B?a0sxbXNlMlhLK0xueEtmRENEZStKeW4rU2M0ajQ3T2ZsL3ZEMGhiU1F5MWI3?=
 =?utf-8?B?cVJFSTZOWmV0NHZ6WEpZMkNjUlFIdFhJTnFDNlIwdE04UVA1MTFLSm01SmJi?=
 =?utf-8?B?MlJ1YTgyUFNnV1preWxTMk9SUmI4aVY3NXpuWi85dVFBc3MvRHBLakZ1L1c0?=
 =?utf-8?B?c0ovNFc5MUZUNGZCSHNkeEEyTGdkUUZrMTZ0YUtBSnEzQU44b2N6QUxJWkh0?=
 =?utf-8?B?aUtPZXBSWTlCZ2M5SVJBM2UxNmRlUTJLRjB6eStoR3JCZGNvY0ROaE1sYzNp?=
 =?utf-8?B?cWJzZXJWT0pJS01pb0UzMzVXZVVobGl2M3pDTE9wdkZKd3R3ZlVJTEREYVpn?=
 =?utf-8?B?Tk43dlhHaGFJTlMxK3krNEE4T2ZuZHJ0MkpTS25jckNTOC80K1JqdTJPT1Mr?=
 =?utf-8?B?cDJaTmU1WmJzRm53clEvUmFRd2hmNFFaUmZQM3A3UG4wejhJVUVkUHFscFJ2?=
 =?utf-8?B?WEk5V3VXYm1kVXVaS1Z2Yll3M2FtR09QVHNPMUtTNlVKMUxNZ3pkK1hXVVJX?=
 =?utf-8?B?RVE5eEZFZjFzT25zRWlOc3ZCSUVWUFBGTFNqN1Y3cnJCYndudTB5V3d6RmNS?=
 =?utf-8?B?VUxLZ1VwZnhDL3FWcUV4Vzd5Vm9BTmd5dkJQdzUvWkxXTGxmcDdYZEVGV2Zw?=
 =?utf-8?B?MmJld2RmUnpjSXNvRXg4TXdBWGg4bTc3Ly9nWjZSSHd2RDJJdXZMeHFLWG4x?=
 =?utf-8?B?c055U0VJRGNPTW80YzMxSWV1ckNiczJsYU5NTmYrSlp0NHFDTmlRempXb1Nl?=
 =?utf-8?B?Z0RYTCtCOGliSTF6a0Npdmh5dWpieTBrbkZFR2RjUG1VOXlWdkpWTG5tdFBw?=
 =?utf-8?B?aUV0RFJpNjdYenVEZGE2L3lxeVp4VHhUZ0NBa1IrWVpPZEJ0QngzNUVEV3Zk?=
 =?utf-8?Q?5d1ZD0M2INz3KClcH1wT9Y8=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d2a451-1fc4-43d5-a447-08dc31659d36
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 16:12:48.0726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L65ZHLpY4TzPgPGKSRw5KAiXUIuiiFVFIkODeqM8beAlUKEomv/ddTuJpbUz4/bMxsN3Jarq6c0acz49uqYgJ6HT8L3/0zjt/wH99zLuc0lDHIdn28Id8GwbCegz/bQX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7695
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 19 Feb 2024 16:13:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4845

Hi Luca,

On 2/19/24 16:55, Luca Ceresoli via lists.yoctoproject.org wrote:
> [You don't often get email from luca.ceresoli=bootlin.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> do_cleanall can produce failures if using a shared download directory. This
> is why it is forbidden when writing tests that will run on the autobuilders
> (https://docs.yoctoproject.org/test-manual/intro.html?highlight=cleanall#considerations-when-writing-tests).
> 
> Reported-by: Sam Liddicott
> Link: https://bootlin.com/blog/yocto-sharing-the-sstate-cache-and-download-directories/#comment-2650335
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   documentation/ref-manual/tasks.rst | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
> index 0db960b22f80..c754eb15514b 100644
> --- a/documentation/ref-manual/tasks.rst
> +++ b/documentation/ref-manual/tasks.rst
> @@ -474,6 +474,19 @@ Typically, you would not normally use the :ref:`ref-tasks-cleanall` task. Do so
>   if you want to start fresh with the :ref:`ref-tasks-fetch`
>   task.
> 
> +.. note::
> +
> +   Never run the :ref:`ref-tasks-cleanall` task if your :term:`DL_DIR` is

This also applies if SSTATE_DIR is shared I believe?

> +   shared. This would break in this scenario::
> +
> +      dir1$ bitbake <recipe> -c fetch
> +      dir2$ bitbake <recipe> -c cleanall
> +      dir1$ bitbake <recipe> -c unpack
> +
> +   because before step 3 in dir1 there is a stamp file for the
> +   :ref:`ref-tasks-fetch` task, so the unpack task will try to extract the
> +   downloaded archive and fail as it has been deleted in step 2.
> +
>   .. _ref-tasks-cleansstate:
> 
>   ``do_cleansstate``

We would need the same warning here for a shared SSTATE_DIR I believe.

Cheers,
Quentin

