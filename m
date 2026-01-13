Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F087D2D11A
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:45:03 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60341.1768315493993408306
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 06:44:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GZT3Fhh5;
 spf=pass (domain: cherry.de, ip: 40.107.162.66, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1sDndLPTu8XsE1qf8Dh5RaxSUppkxaIbv8P0dCUdgsoPA5nqdgrFCOiFo/jwdWuWgKQmjzO1vO1XVpYPHbOewGpJNETV3qZKEahzBMZlhfwipFMQ8XGMxIFXoJQq0r5gyOBZesSZ5tkq6BIauZD2wrNTPgDbhoZDaFS+EnJWlpcVON+TVX4YhW7AHzP0LBq6cK8Nky0TYCchEN1sqmUoCK/cilmku0FB35Xg/yZPS/P8MK4wfDnEyTR7Z6NuTiQOa8Yq4zP3GuKzIltSfGBJkfz+YRCxd0AWEDQGbG2rZxmX8POEDiVgMI+TpUrRNqsFsWNXLt3s4TeyL1fYNGKhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaProYRVusNjttr2sA7U9fiM+q/oGw8z4MJLKkxnCKg=;
 b=Vb6u/5o1lGoN1eCA5ZdXKst7ZQlhDO3S5M9gpT7B70eFsOnSNnmviv2lZwTvYOvuyLMEg+wE/VIYiC4m1HhHXZp85fGx4gKj+zALWW9dpXOKi3he1S4y+cS3v9pHlrevuSZ6h99d2G+qEjMsKU+CB1u+Wj6BCtPZVjbf5TFOZfFx8CD+yATX2F71DGqHB1zwoOOCKGDdQmQ2xbFpqrqdSG70p7MaC0RbEg+JawfNBGPbnf8IiWumbcnJ7YjPjPCvSwDyeJBgz5sKS7OQUGWqkgfWgWZ7xZOt2EHxKGsfA+ihzTNWmYiNxF+bhGW0BzSa1VP8dQgC1lpvrt6BTrncRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaProYRVusNjttr2sA7U9fiM+q/oGw8z4MJLKkxnCKg=;
 b=GZT3Fhh5/7HovU9hbQ4L23D1P3LgvgSUEitWT+zOPFoV5kJbE//3ZpaFL3Yzm6SdajGW0Z2cswGHUZC4tY6/qFA8W5UO0UUX/LQNHwlAuL0DzswvFis+JJ+Oc8mgoW6y7cjzXFxTLBMuVqs/lN+f4Aa/jUYY9ZM0zFuTm2ukXSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DBBPR04MB7818.eurprd04.prod.outlook.com (2603:10a6:10:1f2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 14:44:50 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:44:49 +0000
Message-ID: <11e8cf92-75a3-494f-98e1-7c038bace0cc@cherry.de>
Date: Tue, 13 Jan 2026 15:44:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 33/53] README: remove obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-33-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-33-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0261.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::15) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DBBPR04MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a0d57ef-888f-4455-3d41-08de52b24df0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z21zdGVrcWFJM3hIWjNVd3B0Y0U5VkF1UkpwZzhoQnJxNEUwM2FNeWJVY2Jo?=
 =?utf-8?B?WTFQa01KeFBSQ2RnUFRISEhscHB3OWw2c0tzeU5UMGR5RVNjRVgyVzZwdzYx?=
 =?utf-8?B?MXZPZWk0cWJXL1VjZlYwTXRaVWlOM1dwQmtvUUVRNG1lU21tVEpDZGFqTFBo?=
 =?utf-8?B?dU84bUFQaDlFaGtXNGd2TlZyMDBIRHFWc2tzaFJyQVd3bVNXS1pmTTJiakJU?=
 =?utf-8?B?ZjE1NC9BU3I2dVNrN0F3Q0xwQWltWTlxQnNpMFR0MzBtdWcyS21xZkdRSXVz?=
 =?utf-8?B?VkxwQVFpd3UxUmpVV3dKNTAycXVNNXF0OS9LOTdxVEtxMkJFd0E5UExxbzhM?=
 =?utf-8?B?MVQyejBKWm82RkNJdWJPTXdRZnNxVndTb0JJeWQvazJTNmdkcm1rb1JLbjJI?=
 =?utf-8?B?VXRNL1VIVzdiTy9XYVZWdDdiTlh1aWgzbS8xQWVleWhYSFo2dkhtY0podFNP?=
 =?utf-8?B?dnNzNk1leGFJNk1GUzl3UzJFV0lKbGZldE1uMUJBTlN1bzRxZ3FKY0llY1N3?=
 =?utf-8?B?emU3KzNVUDRZUEhOZnVBTlFDTFBxd0hWZmNVTEkvazZYRmdwZDh4VzUvdVRZ?=
 =?utf-8?B?SWtVSWcwZUZWUnVHcU54YmcxTHovVXFmQ0tkc3VqbzJ0czM2US96aXJvakNQ?=
 =?utf-8?B?WGFMY1NIQ1Q3RmtBT1dxb0p3VTluZkdJMk80YUd0QUdCU1NnTjJ3UytBL2wz?=
 =?utf-8?B?cnB5MG9lanlxWmptQ0kxdjR5OFJRV1Y5YVZPVW1pMVI0TVVoY04vOUV0dVho?=
 =?utf-8?B?d2V2N25HV05oUlNWemZ5Uml6b0N1d3R4dGI3OWVYNlNvbnZWVDI2d3RaUmNB?=
 =?utf-8?B?T0tzWWpQdWVhbkZPanpGYnRkVnBKVVlYc0I5V2pQSWxjUXRRY3ZJTDhyWThI?=
 =?utf-8?B?a2E3N3hQMmErSEc4YTduS0RyeVR6bEtYbnNKUVU1ZnNCMnorM2tGUk5uY2pD?=
 =?utf-8?B?d2xLaFFBME1xTGplaDZNMFpveDFjQUpnZ3EwYnJFT2Fldll6cFlxL29sUEhO?=
 =?utf-8?B?cTc0bEVZUDF0NGs1dCtkZXdyQnNxWnc1ejNiNk8vRk9OOWdDT0lMZXBpWDZJ?=
 =?utf-8?B?LzRmM0IwMlg5cWR2cmEwVlFRbDRxNFNRaE1vclFBMlJYS0U5MVUxS2JMazky?=
 =?utf-8?B?UVdBSDNwQ1ZOR1ppWVRGVWtZZEQ2SW5CdURrWTdFcFdBZXdZUmw3a3ZZUHZm?=
 =?utf-8?B?RU8xTERFNExjc0s1TEU3SFI5MSs0cWRIRGRrQWJWT01EUjgxMU43TVNnK1B0?=
 =?utf-8?B?R2pMRzE5YmdLZEp2cEdkclBLYU1VOWU0NG00RE1Bek03NCtxakZQWnZDNHRV?=
 =?utf-8?B?cEN5Y1ZTMllCZWNhNk9UaHhWSmdsaG16dFRtOFA5dkRHTk1WbktOalNITUhM?=
 =?utf-8?B?ZE1SRE1EM3hsV2hmQzRsMXVJbitrUXVuNjU1cEJDV1FQZ2g2K1lHdlBWNkZ2?=
 =?utf-8?B?b3BheTd3QXFjTHFyb1BwMjhzSURSa0VUYXp0cjBNMTZDbkRpS3ZMQ2hCTi9O?=
 =?utf-8?B?cW9JekcyQytoVVRWeWkrSDRTKy9EbUlJd21MbDdVOXc3MjZSdlovMFR4RWk0?=
 =?utf-8?B?dFNWTTB4aU9GUVJzTk5FbkUxRTExS2VzeldvRzdtVTIwSFBVV3JWeno4andm?=
 =?utf-8?B?ZFpIdXErN2RVbmNRNmlGTitHUnQ2V1lwcUJrV1Nsak9vMWF4bkJ1VitPSk94?=
 =?utf-8?B?TnR2dTNVYUNMcjF4NmNiQ0RrVmw4NW9sTUlUbzRuWXB5SUNnWXc4RUdlTC9i?=
 =?utf-8?B?c3hUbkFUbjVNVjc1cWZLMWs1MmZTeVN4WjNVS2RwaE5rdDUzMTBhekl2VjJR?=
 =?utf-8?B?eFpjRDF6TitPeHgvb1o2bEdDeTlTQzc0bkpBVGlLQUg4TGxIclozUWRwdG90?=
 =?utf-8?B?aGNJWkRhSGM1RlBTTjZjUWNPNUNQeFk2cDF0QkJ2dVNsOWc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cWRJZW5zaVpSN0JHRis0eGc5d3ltUHJ3Sks5cWZCNndPeU0rMUlDQlNUa3p6?=
 =?utf-8?B?c0pZM3MvSjdITDg2YUppK2RjOFpkRFNleUJaV1RjaTJiL0svK3RKZ0JEcFhH?=
 =?utf-8?B?OVEzV0prMUZtdXcvTkhaYzBhSzBaZ3BYSVo0bzZJOXhqRi9OekxiRzBCSEc3?=
 =?utf-8?B?UGFFaVpEclZBNjFLRjZ4V2tXYTZWbU02NDlQSFdhdFgrLzVRL0FMZDlmcW9k?=
 =?utf-8?B?RHdTZTZuM0JsaGxicUQvZ3l3Y3J3UTA1T3FGcEhpUWhYTTVXYlh4RHI0REt6?=
 =?utf-8?B?S2hhK0thMlh0SHdaTE84ZFBSL1ZsencyOTR0a1FCVlUxSTN2S01uTjFvV3BZ?=
 =?utf-8?B?ZlQveUNhelg0MnBIUUVDcXI2dnlIMmw0NlFqTTA5QWQ0VFdiaUlSZkdGNGZH?=
 =?utf-8?B?M3ZqWldnUjVOTkc5Y2l5b2ZpbS94UUkra1pYY2REM1QxWFpXZk9NZnNNV2tw?=
 =?utf-8?B?YnpqZU1sbnIzYzE5L3I1T2NzUUdvQkZVc0tRdUU4akZlcXRoTEhuRjE2RFQx?=
 =?utf-8?B?Y2d1ZVFnd1Qwa0NJTVVTdXZVZVV6VmJrZjNYb2I2ZVllOGZObmJTaG5aZEdX?=
 =?utf-8?B?RDlqMEFOa0dpeHhGbStSUUg1dWVvOGJRYThDWGZrdzRwV01ZeFdhMjFhb1oz?=
 =?utf-8?B?Z3VaVG9uOGg4UVBCSmtxb2Z0Y201TnFxSnJXRDBqRzFSNTZzajVYNkVSc0xi?=
 =?utf-8?B?R01TOHZwVFNUV21zd2s1NjV6c2J1WEVSRU5HclZLWXc3SFVkVmNBdy9LMHly?=
 =?utf-8?B?bEFITmZaZVd5THh0dFYrOTRtbEY3a0FKcGRNb0l4RENvUS9DU2dNQ3J1Q1k1?=
 =?utf-8?B?cDRJaXFtYktmWmJSTHdDeUp2bXlrUUpyMENZdmJCVkdtMHJieUdUQ0JXcHBF?=
 =?utf-8?B?di8xNzZwVE95WTQxc0FsZ2tOSHI4RjlEVVUwbERtM0xJVWFSMXc1azhlVVUz?=
 =?utf-8?B?L1VhQWIzY05uWmlvNzQxd3ppc1pZMFd2SERtK3JaNFR0TnEwdE5lck53K09O?=
 =?utf-8?B?MmtNQVJwWllPeklCYjZONmdad3Z4R252cGhyam5xZ0FSM0U5YTNiV3prUHNj?=
 =?utf-8?B?SExxN0hQUTEya2V0bGlqR1NSWlhuNFN2UkFhZUltdXFtUjlETXRiaVBvTHFW?=
 =?utf-8?B?VTZhWWY5Rm5aWjZZbnFhWHpFMjhrVTlzUHQ0RnhRVGkyZDNxVDhTT1RuSXlF?=
 =?utf-8?B?WDNHOVFnSFpaOHZ0MFJhWFl0d0ZOZVN0bDBnVHdzNGI5MjlTeTR5clhZc2hu?=
 =?utf-8?B?dVNDREZHRmFzS2JPWHNmZ3l5Z09nMzI5YXRDaURaQU5tNnhyUHB0aWtLK3Zh?=
 =?utf-8?B?bWZYS0RpbENsSGtOSCtWeW9ON3lSQTB0YmNzMk8yNDdPbCtCdUtqRlN5NzVv?=
 =?utf-8?B?S205cGE3TzFxelN1M1pKRWFIN3FZZUhkSitjckNTZ29mU0svM0lhL1B6UjJT?=
 =?utf-8?B?S205dkxQVlVMSDViWmN4KzFUeXFwSU9CTnl6RVBNYUpTUUFmMkFHbTNiRVVJ?=
 =?utf-8?B?Z0RLMExvSHFCbTF0WnJnQjZmQnR6YjBsbTZKb3JFK3hMOHQ0YnN5OWhERjND?=
 =?utf-8?B?UnlQRHM5N0JNUHdPenI3c1Z0ZE1RQytkUjBndTNNQkNuV0Z2bXB1YjVmY2lr?=
 =?utf-8?B?dXI4V1R2OG9rSk1DTXc3UmFpQjJaVzZJbUVMYUVLN1JwQmQ1YnA5bjlzSWtT?=
 =?utf-8?B?Q05GSU1FYUdrc0VxTVY5ZXkyWG95VEQwMkduL0ZrY25GelNFUEZqQjJEdDk5?=
 =?utf-8?B?TU5NekZyNkhsTGhRa1cxY0lxdTcxTWoycmxsOHFUc2p0bnFGODcyMk5UZG9Z?=
 =?utf-8?B?Z0Vpdm5lbWNseEx6Z0VabTJkNXBKNlJjUllSUkV6NU02cmhIMWg4NnJLSndY?=
 =?utf-8?B?aHVoQStWaTI1MGpGSndIb00xQkQwTjh4Zzh3Vmhyb0Z5OXJJQXpBNHZwbStT?=
 =?utf-8?B?eEJCMmdWYi9yK0Rjd0VPZkFRdFJGTkZ4d29ZK00vWHlRVjN5V0gxUFNYRVgv?=
 =?utf-8?B?bE1mZVBWSDBSV0h5Z1hXKzhVODZLSW5RaE5aekZ4SG10Zk9SaC9ORlF6c1Z0?=
 =?utf-8?B?djdOenFobWZ1QUxQS2VoUTVrMy94VUk3d25rTHJyNi9NRGRlQXV5RFR0eHZI?=
 =?utf-8?B?SlZSRzI1M0gxVUtVY29Kc1ZnZUtWNjNYV1RTZzNqeGNrQlR3WmIxalVyUkw1?=
 =?utf-8?B?Ny9tbE9WVXBJOXNJeWNUYjdUMXNpSWdsL1FGcVJhdjNwSzJvSEhHN3pPbU1n?=
 =?utf-8?B?WVZYS2RENzlybjJaREJJd085Q21BWjFhbFRGYWRib0J4eUFydnovMStTOUFN?=
 =?utf-8?B?U2cyNk43bkQrbkdRaUpiTUhmcnFDWHBrOW4zTGlGYjRqVmNmaEZaUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0d57ef-888f-4455-3d41-08de52b24df0
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:44:49.9181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmaebfSidAOwtHeLX3H3ZIEb0IZC9r+hXG6FTjmBLzNswEvn8TLn27vUjBUI9dmdPgfR8TPcleK64r6msg2ShblynADfnmy4U2PMDq05xas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7818
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 14:45:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8522

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/README | 39 ++++++++++-----------------------------
>   1 file changed, 10 insertions(+), 29 deletions(-)
> 
> diff --git a/documentation/README b/documentation/README
> index 56eac7ca1..58b00ff5c 100644
> --- a/documentation/README
> +++ b/documentation/README
> @@ -1,33 +1,14 @@
>   documentation
>   =============
>   
> -This is the directory that contains the Yocto Project documentation.  The Yocto
> -Project source repositories at https://git.yoctoproject.org/cgit.cgi have two
> -instances of the "documentation" directory.  You should understand each of
> -these instances.
> -
> -  poky/documentation - The directory within the poky Git repository containing
> -                       the set of Yocto Project manuals.  When you clone the
> -                       poky Git repository, the documentation directory
> -                       contains the manuals.  The state of the manuals in this
> -                       directory is guaranteed to reflect the latest Yocto
> -                       Project release.  The manuals at the tip of this
> -                       directory will also likely contain most manual
> -                       development changes.
> -
> -  yocto-docs/documentation - The Git repository for the Yocto Project manuals.
> -                             This repository is where manual development
> -                             occurs.  If you plan on contributing back to the
> -                             Yocto Project documentation, you should set up
> -                             a local Git repository based on this upstream
> -                             repository as follows:
> -
> -                               git clone git://git.yoctoproject.org/yocto-docs
> -
> -                             Changes and patches are first pushed to the
> -                             yocto-docs Git repository.  Later, they make it
> -                             into the poky Git repository found at
> -                             git://git.yoctoproject.org/poky.
> +This is the directory that contains the Yocto Project documentation. The Yocto
> +Project documentation is hosted at https://git.yoctoproject.org/yocto-docs:
> +
> +This repository is where manual development occurs. If you plan on contributing
> +back to the Yocto Project documentation, you should set up a local Git
> +repository based on this upstream repository as follows:
> +
> +  git clone git://git.yoctoproject.org/yocto-docs
>   
>   Manual Organization
>   ===================
> @@ -261,9 +242,9 @@ For example, the following .rst content will produce the 'expected'
>   content:
>   
>     .. code-block::
> -      $ mkdir poky-&DISTRO;
> +      $ mkdir project-&DISTRO;
>         or
> -      $ git clone &YOCTO_GIT_URL;/git/poky -b &DISTRO_NAME_NO_CAP;
> +      $ git clone &YOCTO_GIT_URL;/git/yocto-docs -b &DISTRO_NAME_NO_CAP;

YOCTO_GIT_URL doesn't exist anymore, please send a follow-up patch to 
fix that oversight.

Same for the nested variable, but you can replace with 
YOCTO_RELEASE_DL_URL and YOCTO_DL_URL for example.

These are unrelated to the patch, so

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

