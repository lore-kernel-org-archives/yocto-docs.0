Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE6EC0219D
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 12:08:29 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.63])
 by mx.groups.io with SMTP id smtpd.web11.10747.1739275701271291824
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 04:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=R/ZPGb9F;
 spf=pass (domain: cherry.de, ip: 40.107.20.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqT85Hdi4UTcKrJZaMb5wYv8XcR1MCAdw+Z7qOKOE1l2fDEzyhF2sZKuDT8/5NzPfJeIRSxtTdbQ0vI61hrpnTs1dJE9Sv9BAnjPNxciaEiR8vdAYZUcNnN0NzuEAMwkoGf2QWIZQbO4tSlHODubAuE2Iv9WRsdp8LAxMU/FIugnqyW2tUEtYFx34QsAo1ZzCanlfbVdxHLaqZI8PezoMxLqmq2guSOQ4+ApmWInsyH9CI1+v6aoIW/hcfnaA5m8pmElXDu7PF9QgQi3/DAQMtrQACiVDE9BxQ/LWAqgWL0KUrsP5uj23iDKcPFcZXG6J6Sr8EWHeV9eYoqHXOr3hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecENR+Nw0ChZOpBht0bL9ITxjbMzFCKnqhLrsPssxZ0=;
 b=x97o3i0spC1hHOZvzrUtsnDVQOC3KmIGvIXj809lmUyeeOPMa02B3jfuYfan4LEeNDOcp/nL5W13s/OUlgASyfZD4KsYxRn3yRXR1H1tj+FrTAOg5bRE6VyO21o+kIiV+NrchfyHxe47iWhi8EH4jRIvoDL7njRHBw4Ku8S0WHQtxRK/HHaKjgeI5NZx8KYejUeVR60TUmfPCEuaGDEYDD8tHGnvph1TwRTbTqqwxpzlYVLrF8EIMhb5TuW6j08/uvdnPqlK2O86LxIlJ55NjN5rL2vVjku0DV/NcVpf6DdYsTabQL0Uoc7bxXb7fM42yiJUN0xcJMlVefG9CGN/hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecENR+Nw0ChZOpBht0bL9ITxjbMzFCKnqhLrsPssxZ0=;
 b=R/ZPGb9F6Q9OkWZ7edmFlXu/GOt8zIoPBKrNrPVhixS+gLGBvcp4AEZDP5IXq6I7ROo5KwsZOIk0eZq0bb8idNNgipuwkaee8cYG7rEn5npms9vnsOJ3iDmpVVgvTXdnCiM2X/yiH7abdGiQgA0gOcdUx7Mmgc+rchO8M73zC1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB8045.eurprd04.prod.outlook.com (2603:10a6:102:bb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 12:08:17 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 12:08:17 +0000
Message-ID: <5474982a-b6ee-49f5-aff8-47ea3da5c22b@cherry.de>
Date: Tue, 11 Feb 2025 13:08:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 6/6] dev-manual/multiconfig: add suggested best
 practices and baremetal sections
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Hatle <mark.hatle@kernel.crashing.org>
References: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
 <20250207-multiconfig-doc-v1-6-f63cdab1fad9@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250207-multiconfig-doc-v1-6-f63cdab1fad9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR04CA0131.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::29) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 48a54873-043c-43a9-370c-08dd4a94c492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WVJvNXN4RzMvZ0E5eUhIaG9GNjR0Ri9mU1FFd2hrSTR6NXVEdXkvL0hQQVY5?=
 =?utf-8?B?a09RUEk1OWVPc0lmNmpDcGRFZ2h3M1pIMERCbUhrWVR0RzR1NWgzTlF2c2Ju?=
 =?utf-8?B?dkI2blJwdnZaWFN3R3p4WGVBNko4djgrYVZRbStXY3d1bi9ndVp1d0R3Q3F6?=
 =?utf-8?B?ZFJ6RDZaOG1KNTJ0YjVvK0pITUlMUHRTVy9iOUdFUWh2UG1iR2JQakdqUHJj?=
 =?utf-8?B?LzdDRDhWYUtuZGdydlVDS0tjUXdlOTZCNUZiSGRQeU1kNzF5YjhzSUptSUVY?=
 =?utf-8?B?dmxDZVJJRk5lcEdlVVpHWUVUV0wxdnRzSzduZGRISUpjb1BlMjE4Q2xyWnRk?=
 =?utf-8?B?eXozTVU2MExXS01YMnp6bTJ5STJkNGMrcWlQVTRpeG8xaS94OU5wZmpDUXZ3?=
 =?utf-8?B?T3FEYW1vclE1Nkw0bkpSR2pCcXJNMGJUSUVmVVN3Z2NIdWtkOUpVbGZiZzUw?=
 =?utf-8?B?a1lvcm94cFJlNm1ndGR3UUdMcENrbFY5djBxVmJVaVMyUWdJK3lUZkcrMXJC?=
 =?utf-8?B?cWI3bURaMzluZ1Vqck9XRTd4L0o2Qk5lcFNqK0JuY2dpeXR4L0M0U052SFBJ?=
 =?utf-8?B?a1RzcHpoOUU2cTJhOS9XWTY4TEk2SlNHU2FzRXZqSFJtaVR0dy8rMVFCWkJU?=
 =?utf-8?B?ZWp2WUwvbWNFaXgzZ3RHbXpyUzkxc3NkcGMrQjVEMXRyOEVUenJGSVREZ0F6?=
 =?utf-8?B?RVMvTVRXM2NTM0QxL2xvM3cvc08yakN2aTdVVG0yY1Z2RFp1WktJYnUzSXdY?=
 =?utf-8?B?VFVVYlZHR2VoZXUvZGROMlZ6K05TZ1J6UXJlaC9EUUdnVXhLSkV2Sk5za1ZE?=
 =?utf-8?B?V2ZvWW5YLzViRVVwWmxTanRqK2FwN0k5dENOeGRDU1ZWVWxaazlIRW9QSURD?=
 =?utf-8?B?d2MzaStLbko1V1dLUjJwOWcvdUVjTEJRN2hQbU1hL1p3RWhaTGVSbmRtbWlt?=
 =?utf-8?B?NDZlOTlkV0hiZGg4MzF2WGpaSFRHWnI3VVhTd0p2eWhBSWJkMDFFc29FdDF1?=
 =?utf-8?B?KzhJYVkzeHJaVU1VYlpuLzBKUUVJOGh2Z3F5UVNPVTVseU0zOFdUL01DZ3Fx?=
 =?utf-8?B?NVA1WVh2TVVxNW42NEk5RVZaWE5uYUQ5K1o4V2FMZTVxQjNyek9qUWJaVE0v?=
 =?utf-8?B?MXM3RXZuWEttN3dpOHMzcjVWbjhDcTlXM0tCK2lVUEFtdHNKUnlORDBHS1gy?=
 =?utf-8?B?QXBEYTVCbGtES1d0ZFdhM3d5Rm5vTXdpNDZkYnlMZDErNVVDZGtqRU9QWlVQ?=
 =?utf-8?B?bjFzeEdVRTRwQlRKSkdSdEZpMWZWTldQWXB4N0djbVViQVp0MGtaa1Z4M1pz?=
 =?utf-8?B?SUVNVEg0SktCMHR5dnkvU3NPbnpUcTgvWVhEaDFBd0Y0NmpKeno3cXQ0SDdh?=
 =?utf-8?B?RXdMdytESFd0NUFjVkxBU1VFcDhlNmwvdFYrNDhDQWEycjA1NEVhUVJjaVgw?=
 =?utf-8?B?TERSa2pkbDFnek5mVzdNNVdDY2RBVGtjd1pGa2ZCV2xBR1p0RDF6LzN2Y3lt?=
 =?utf-8?B?bVQ5RTVhVkdpQUZuSW5BakRmRVZPdHBpS0xpYUl4ZE50TlBHNVo3K3ozSUMv?=
 =?utf-8?B?OWk4L3JXVFZpQVRRNzJDQ0JnUFNqeDlXRFhYc0ZsZWNUa0JlTUdZelMxNjZr?=
 =?utf-8?B?bTkzR29oc0NEUGdqaURqVHZBVjlxbndIM2EveEZSalFNSUhnQkJjWTViV0Vu?=
 =?utf-8?B?WGhGbzduSDBVcVQrL2N3aUFQOGZkVEdiYTI2UXpDYVl4SnM0ZVhHai95MzFJ?=
 =?utf-8?B?Qmo4Ym1pRHcrT09ldExYRmtFNm5aK3NvQW9talhzWjNkRHBDdEkxODRoZ3cr?=
 =?utf-8?B?bkMreXAvKytPczMzUytxQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eWEzTWhSclVrZ0xmY2Urc2tnY1JXV1FZYTR6TlZDckhtTjJRaGlGOHM0SllL?=
 =?utf-8?B?ZzEvU3pFaDJFNWV2VEM4SEVkeXZJMFZjeVNiMHpENjk2Mlk4WnBjQmw5M0Q3?=
 =?utf-8?B?TkM4NE9rN2dRTHEwek1LY0VtSWcxWnIwYnBpTFY4WEpIazVoenVtenB0VEVk?=
 =?utf-8?B?b2llZDBFSzkrMVVZdDd1b3Uvalc3ZHlDdUd0cVNpTWJ5dWJUOWIvVEd1VGpr?=
 =?utf-8?B?WWRMK3lRdHkrQU1ySkVNR1pvZ3Zab00xTUxtblJNbjdUb01qRG5xdStNVFRI?=
 =?utf-8?B?K2dqNU4wTUlSdDdHSVQyN1c2UFJTY3dRY29mR3dvZ2V3SEkrVzFIdGVhdzdY?=
 =?utf-8?B?QkdCOG5Qb2hLUXlOdlp6cVN1blpZOEpJZ2VQT0pwUXQzSDg3WFA2WFRHSFNY?=
 =?utf-8?B?VEh1Y0YwQ3llZEdySWo3bG5zOU95WGUvQm4yeWE1NEhJZlQyeXlFYXRVZEho?=
 =?utf-8?B?Nk50MnZYNjRoUXZZdkZMYVAvaTBrakdlYTU0U0liOHd6ZWFPMWxiZWJZS2Zp?=
 =?utf-8?B?VHhDVGxnYy9kNEpWTHQxckVxZlJ5d0ptSDIyNUlyak1LRk5hSjFlbnc0Q3Vh?=
 =?utf-8?B?Wm5ZaE5HVk9vVjVLNitOV1JuSWFvQytxRzRHcUQvb2YyeEtQczhERWYxV1ZY?=
 =?utf-8?B?dlpSMFZEcGtPaldxeWZiaXhwcG1Rc3Bud253c0FZTkM0ZCtOUjFpVGRmZXhT?=
 =?utf-8?B?UFhKeURIQkVRUm4wb2hzOHFOc09QMmpTS01reFBCYThsRk05eFFBazhTakpV?=
 =?utf-8?B?TFUzS2prT0w5SmVMWEI0OEkraXJjMURtVjZaTnkxU3locTJWRktzNmQ5OGZw?=
 =?utf-8?B?Q1JjeElLN0FzZXRSUlROYmUzTHV5MVRIU0JPaEhiRnB6dVVjUXVvU01oOE5W?=
 =?utf-8?B?czMvYlVhbjFGb1pteE0rRWkzc3N4aThMdEZiQjd5MzMyOFk4MlFkOGZlWWU0?=
 =?utf-8?B?VFlzNFZ5QnhWcGZ2OHF0UEFldnEwVFQydmdKY1dPOFkxZ0k0WCsyTzVEZXNY?=
 =?utf-8?B?MjZyakFZUFl5QU1KeVY1Uzdzdk9tblZDVTIrSWVwcUg0LzBEeU5OblN6cjg1?=
 =?utf-8?B?UmJab1ZSdWhUSGZNaVhtYnhDd01CdjRybEU5cGg0N1R5QTFKRExLc252ZEVv?=
 =?utf-8?B?OHhZemtOUWRPbW5FeTQ5OXdyWUZCT28vTzd0RXFKa05Sd2R1VGM1cHpnRFEx?=
 =?utf-8?B?RWVlcEgvNURjQXU3OEE2MTQ2U0x4Y25TV1JmMHp3S2NrS25QWXZpb0lEanNO?=
 =?utf-8?B?RDkyUFFFVmV6SWo2MC8zZ3hNaHJzS3VRMDdoZTQ0TG5sL1VjL1Fyb0NrUTFC?=
 =?utf-8?B?a25JellhdjlJblkrQUU1bXJUeUVmeTlzaFU0WENYdE5JMk9DcmRNOFozTUVX?=
 =?utf-8?B?WStjQWcrdzd0UXpXNnRIM0MwS2JhWkhoZ2hhbHdHUkJrUGhqM0VkeEtTVERQ?=
 =?utf-8?B?eHFkL3k5NEE3UVFKSFBYeFlNcnYyenFEWlBFbVJ0MS9jbWNMcG8yQk15akpu?=
 =?utf-8?B?azZCQkN3RVVnK3dub1lpNzNrY0lsaDFzV3BQTWN5WWdualFTUjVCM3l5dUdC?=
 =?utf-8?B?Ni9uWVRhRWViSVBEV1RkaTlsbHBGZWZNMERaU2xWb3FDMURmSTRLaHJXQi93?=
 =?utf-8?B?Ym5jVEMycEVaamZtdEJjZWtXUThZd1hpRkhQUDRxQyt0N3hkUzZMczZ3ZFND?=
 =?utf-8?B?WE42M3dqaUVJQmZMQ0FuTmpQU1VrUi9WdUFGbGRIZ3dvZFc1N1lIT0twaTlS?=
 =?utf-8?B?SXVacUZ3N2RjamJ2Vi9iQ3BZL0dKUEg1cm9iOUMzSVEwUFlmaDdGRUhVdGJH?=
 =?utf-8?B?TjVSaDYrVmIvL3VxMktYdUNHTmdLRFZvMDJiZ2Fwend1S0ZiSCt6c0ZaWE1Q?=
 =?utf-8?B?SnozVVBuU2VkMC9HRUdNUkNOQTFTL3h4ZXZpdlpkY0xwOWE5aUp4c2VvS0Na?=
 =?utf-8?B?c3R6NGsvY1drYUNLUUJ1aG9HSUNZdkhGWjZjcnE1aGxJUkE1dis1Vzd3UXh0?=
 =?utf-8?B?c2JHNE1OejM1K0xodmkzd3BHNThqNmFkcDdJYVk0VjJkZXdsRUFYeVljTUtI?=
 =?utf-8?B?bi9oVHpFMXIvZFZoVEFEVE9wdHUvd2tZK05GYzJTOE1PMHRyV2RFcmtEenA1?=
 =?utf-8?B?R1FJekp5MlBFTEhzRWUrd243SlM5aHBqNXc2TVlyM1cxSERrMTkzeldGd0h2?=
 =?utf-8?Q?lh6L/KVYoSbH8a8/U9cDrBI=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a54873-043c-43a9-370c-08dd4a94c492
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 12:08:17.1815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJv6uJS7vLe9yugqfAm9O1fAkzrC6ZvC6tYu4M7UdfvS9a6CXu6rWYP7dK4+Dvbk6DcSwH+Tmy6abPGV16mAaHru/nk7slWGERcM3fXzuDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8045
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 12:08:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6333

Hi Antonin,

On 2/7/25 5:28 PM, Antonin Godard via lists.yoctoproject.org wrote:
> After the suggestions from Mark Hatle on the list
> (https://lists.yoctoproject.org/g/docs/topic/110487932), add two
> sections to the multiconfig doc:
> 
> - Suggested best practices: suggestion for better design of multiconfig
>    builds.
> 
> - Common use case: baremetal build.
> 
>    This section applies the guidelines from the first sections and apply
>    it to a real-life example of how to use multiconfig. This one to build
>    some baremetal firmware alongside a regular Linux build.
> 
> Suggested-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/multiconfig.rst | 106 +++++++++++++++++++++++++++++++
>   1 file changed, 106 insertions(+)
> 
> diff --git a/documentation/dev-manual/multiconfig.rst b/documentation/dev-manual/multiconfig.rst
> index 27442a042..9560ce5a0 100644
> --- a/documentation/dev-manual/multiconfig.rst
> +++ b/documentation/dev-manual/multiconfig.rst
> @@ -171,3 +171,109 @@ and have separate configuration files, BitBake places the artifacts for
>   each build in the respective temporary build directories (i.e.
>   :term:`TMPDIR`).
>   
> +Suggested best practices
> +========================
> +
> +-  :term:`TMPDIR` (other then the default set in bitbake.conf) is only set in

s/then/than/

and tick quote bitbake.conf

> +   ``local.conf`` by the user. This means that we should **not** manipulate
> +   :term:`TMPDIR` in any way within the Machine or Distro :term:`configuration
> +   file`.
> +
> +-  A multiconfig should specify a :term:`TMPDIR`, and should specify it by
> +   appending the multiconfig name via :term:`BB_CURRENT_MC`.
> +

Provide the example you gave in the previous patch.

> +-  Recipes that are used to transfer the output from a multiconfig build should

+to another

i.e.

from a multiconfig build to another

?

> +   use ``task[mcdepends]`` to trigger the build of the component, and then

maybe use do_task[mcdepends] here?

> +   transfer the item to the current configuration in :ref:`ref-tasks-install`
> +   :ref:`ref-tasks-deploy`, assuming the value of the deployed item based on
> +   :term:`TMPDIR`.
> +

Please provide an example with fictitious recipes and tasks?

There's also a missing word between the install and deploy task refs.

> +-  Firmware recipes can set the :term:`INHIBIT_DEFAULT_DEPS` variable to ``1``
> +   if they don't rely on default dependencies such as the standard C library.
> +
> +Common use case: building baremetal firmware alongside a Linux build
> +====================================================================
> +
> +A common use for multiconfig is to use the default configuration as the regular
> +Linux build, while one or more multiconfigs can be used to build special
> +components, such as baremetal firmware. This section details how one can achieve
> +this scenario.
> +
> +Adding a multiconfig configuration file and recipe for a baremetal firmware
> +---------------------------------------------------------------------------
> +
> +As described in :ref:`dev-manual/multiconfig:Setting Up and Running a Multiple
> +Configuration Build`, each multiconfig will require a separate
> +:term:`Configuration File`. In our case, we will make a separate temporary
> +directory for our baremetal firmware build configuration.
> +
> +For example, we will define a new ``conf/multiconfig/baremetal-firmware.conf``
> +as follows::
> +
> +   TMPDIR .= "-${BB_CURRENT_MC}"
> +   TCLIBC = "newlib"
> +
> +The ``baremetal-firmware.conf`` configure a separate :term:`TMPDIR` for holding
> +binaries compiled with the `newlib <https://sourceware.org/newlib/>`__ toolchain
> +(see :term:`TCLIBC`).
> +
> +We then create a recipe ``my-firmware.bb`` that defines how the baremetal
> +firmware is built. The recipe should contain enough information for the
> +:term:`OpenEmbedded build system` to properly compile the firmware with our
> +toolchain. The building tasks may vary depending on the nature of the firmware.
> +However, the recipe should define a :ref:`ref-classes-deploy` task that deploys
> +the output into the :term:`DEPLOYDIR` directory. We will consider in the
> +following that the file is named ``my-firmware.elf``.
> +
> +Building the firmware
> +---------------------
> +
> +The firmware can be built with BitBake with the following command::
> +
> +   $ bitbake mc:baremetal-firmware:my-firmware
> +
> +However, we would prefer for ``my-firmware`` to be automatically built when
> +triggering a normal Linux build.
> +
> +Using an ``mcdepend``, a recipe belonging to the Linux build can trigger the
> +build of ``my-firmware``. For example, let's consider that our Linux build needs
> +to assemble a "special" firmware that uses the output of our ``my-firmware``
> +recipe - let's call it ``my-parent-firmware.bb``. Then, we should specify this
> +dependency in ``my-parent-firmware.bb`` with::
> +
> +   do_compile[mcdepends] = "mc::baremetal-firmware:my-firmware:do_deploy"
> +
> +The above will ensure that when the :ref:`ref-tasks-compile` task of
> +``my-parent-firmware`` is triggered, the :ref:`ref-tasks-deploy` task of
> +``my-firmware`` will already have run successfully.
> +
> +Using the output of ``my-firmware``
> +-----------------------------------
> +
> +After we have deployed ``my-firmware`` by using ``mcdepends``, we need to use
> +the output in some way. We can make a series of assumptions, based on the
> +default Yocto Project variables in order to get the binary for packaging.
> +
> +First, we can set the following in ``my-parent-firmware.bb``::
> +
> +   FIRMWARE_FILE ??= "${TMPDIR}-baremetal-firmware/deploy/images/<machine>/my-firmware.elf"
> +   FIRMWARE_FILE[vardepsexclude] += "TMPDIR"
> +
> +The first assignment stores the value of the path to the firmware built and
> +deployed by the ``my-firmware.bb`` recipe. The second assignment excludes the
> +:term:`TMPDIR` variable from being part of ``FIRMWARE_FILE``'s dependencies -
> +meaning that changing the value of :term:`TMPDIR` (for example, changing the
> +host on which the firmware is built) will not invalidate the :ref:`shared state
> +cache <overview-manual/concepts:shared state cache>`.
> +
> +Additionally, ``<machine>`` should be replaced by the machine for which we are

s/machine/:term:`MACHINE`/ ?

> +building in the Linux context.
> +

In the baremetal-firmware context rather?

> +We can add an :ref:`ref-tasks-install` task to the ``my-parent-firmware``::

We can +then ?

s/an/a/ ?

Coming from the embedded industry, I find an example using "main SoC" vs 
"companion microcontroller" on the same board drawing a better picture 
than "baremetal firmware" vs "Linux build" especially since we don't 
specify here they could be for different architectures (so implied they 
are for the same).

Other use cases I've seen for multiconfig is rootfs within another 
rootfs, or building a recovery image for a system and putting in on the 
same disk image as the normal rootfs, or building an initramfs with 
another init system than the one used for the main rootfs. We don't have 
to list them all, just sharing here for reference :)

Cheers,
Quentin

