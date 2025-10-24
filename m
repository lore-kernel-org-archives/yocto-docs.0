Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BD0CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 15:24:21 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.3])
 by mx.groups.io with SMTP id smtpd.web10.14127.1761319455856340835
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 08:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Er1Cetzc;
 spf=pass (domain: cherry.de, ip: 40.107.162.3, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gv8Bdv1WT/iqSz0BWEXooLHISv9jSXR1KXBt3Htr9N7CK+9ju6gUQcjwrq4w3jHt3/2pKz+3YqFtyZPGESZoNUzdiCjkd7zOGidLVh+A9ZLErzmWqQRXk/mm3uO13oyrealWeFGw6XInr9OMLtS8eToLWRyx2VlbXKfIk4OB1QjV5PvHlHUbqh0TCwfKKeCm4n2/idMQLQao2/EPdREuOLtmdfHVzAA7Z4gg0oVnFPxPbDUV5F3vusiPbBTGsyYjIEjZ5IvLBoVfBv+RfWzNr62fXyDz4jaojr8fPpj8MfATNQdmBhBFfy0x/VTPYyNkN4Xrf9VzQ+JcqCq2whGHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKZFWOGCH4pf4RvvM6uS1IT7lLyNilFvrdfWldgM5HA=;
 b=rc7MB5Qd4LiL8Z+oLv5+D/Okvt2sqb19TDe42IpH0j5Law5nUXRW9/4FJLV/xaKIykaN2bijTVMcScthQ+pBm+VZ7g9sRNSCoIDqzkrgx/tkMYeBEudAukMHuGWiNlOnanOidu2kBCCzLivtZtcv39538Wmaj3AQR2IZXzaajOgNlCdjJ6HLn+xlW7RKvpiqnrNRvBx5q2FsQdL2psfo6CtxMA8qurSl7xf981/vZuZZvtBBcLXAt8izSJA3HMVSjmYZ4UKPDLufgwrI4CrwHEHESCICBg+GFE2QHS4tPyQPh/07iBsjiXRfMvYiBMoOcMfhzuKWl5OHwiEYmbNe0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKZFWOGCH4pf4RvvM6uS1IT7lLyNilFvrdfWldgM5HA=;
 b=Er1CetzcAedPccPi1QB2xFhqaDSmLNUvmsBWMYmP4oK0ioD4gXzNFn4DyzWCKH1tEsdfu7li5A1s834WNifNNTnSs2qV0C68xsV5UsYGlah+Z9ogQZctYqvZ+06gtyNA7a2KktU0/8/P1woKEGfuN37Jjv1rBfYF+r0s3NqOTlA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9218.eurprd04.prod.outlook.com (2603:10a6:102:221::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Fri, 24 Oct
 2025 15:24:12 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:24:12 +0000
Message-ID: <6dd2661f-35e0-40cf-987b-cadce67e098a@cherry.de>
Date: Fri, 24 Oct 2025 17:24:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] ref-manual/variables.rst: document the
 REQUIRED_MACHINE_FEATURES variable
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
 <20251024-release-note-5-3-second-hunk-v2-7-d15dabc095d0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-7-d15dabc095d0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9218:EE_
X-MS-Office365-Filtering-Correlation-Id: def94ca3-cba7-4d2d-7d62-08de131162dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aVlTbTg2UGxJcEd5cWl5MVpPQ0V0c0plemVCMmVJWStJdHd4UVJBb0VoTlVv?=
 =?utf-8?B?RFhkdEFPY3pldWZKVGlPM1ZFbStTMDZLVHN0UWhjQzY0YzBBZGdNcVBXZm1N?=
 =?utf-8?B?blVPWUlKU2lZNG84akVNeWhGQmh1dFZjd2tlTXNwbklYNEZxZ0svL0U0Z09M?=
 =?utf-8?B?ZjRESERoZklFVGN3MGg5LzhrUmdNUU5Mb1FLM0hiNFF2cTlTY2l2M0t3RG5V?=
 =?utf-8?B?dlVseHNodE5DUzAvNTFyRXlMZ2gvMjFJS1BtSDg1cVo0b01rUE5rRlZlbHcr?=
 =?utf-8?B?YjlxcGk1a3duUjJLbllxSkk4TmhtUDBMYmtRK1NvQThRQ0Q4SC82T0NkMmpU?=
 =?utf-8?B?M2IvM1RyWkhQYW5yYmQ0TERCRFhTekhqRnlIbEZESG92aG1iZytmNXFMQmV5?=
 =?utf-8?B?TE5EZ0xpQkVHTS90RUlhdkRIWlBYTlJsNmdJSHljbmx6S0ZaSjduZmVBMHdZ?=
 =?utf-8?B?VWxYOHlrbmY4a2srQnNsbU5aL0NPaDV4NTEvOVBMK2szT3NpSURDN05yWE04?=
 =?utf-8?B?M1ZPcFphTGNHWDV4MkFIUGxTTUxZUHJNdUlDUjVldm5HU2RqWENmaDR0ZjNI?=
 =?utf-8?B?L0JOTmwydW1tdzVlNjhBd2VuK3V2VzBybXZjYTgwOUhzcTBkL2xFbUo4azU4?=
 =?utf-8?B?RlJ0eUxwSG80NTBYUUVQajVBZkJnM0piMGRiMktsMW5teml6RDFNK0RpQ2FF?=
 =?utf-8?B?R2hNd2F0ZU9zdGI5MGRjUmpVbkYrL0dwQlM2UytLYzhPZmdQQ0xqcGI2ZGZF?=
 =?utf-8?B?c2ZwSTdVSVkwL2cxKzIvT2syclBNMVEwTTh1NzFXR2pKUzVVaytLd05WWWRv?=
 =?utf-8?B?RUNKVkpDUU1jbGZid3lQVWlFbkM0V1o4ZE1Kb1pQVUZQZ3FId3JLaUZMT0Js?=
 =?utf-8?B?bytTZTJwLzZhRzRBSUF1QXljOXRrWktnYWs3aDBMcmkwR2pKamNLM3QvbzRu?=
 =?utf-8?B?R3BNOXJqWjRacE50NE1RcXpTVXFadlVpWjZQMjJDZFV5TTZvWjBkdHFtQ0Yx?=
 =?utf-8?B?ZlM1dC9ndnRnQisydXEwOEhMMEVPMThoV2RPdHpKUzVjcmh4Q1lCT29MTGRh?=
 =?utf-8?B?Rit6V0FsNEV0aDNPT2lZS0xiME85cGU0VXYvWE02VFlHOXMwVEF5R21xT1JJ?=
 =?utf-8?B?TUJhdEdsa1l5Wmc4VXhmWnFzV3FaU3lMTTdodG5TZVp2VUQvT2ZTK3NPZ2Fk?=
 =?utf-8?B?ZEtUYy9KR1IzcFd2THFsWmxLWjVOYVJGYWJFVzB3aXh4Z0xGMU55RDkrbk9H?=
 =?utf-8?B?RE5NQ1ZtQjFFc2FoZTdQQXdNVllBMDlmZzBrTWNmNG1TazFvMU1ubjVNNDhq?=
 =?utf-8?B?UUJNdi9vVkMvUHg2NGpvZ1hwSnZqSE5GV2hnM0ZrS2xidzZwaDlLdzcyUVox?=
 =?utf-8?B?ZDZnbzlqUWRaTHhUTmZHTHdvQTNMcU13QXpGQzZSRm14REQ5OFlnQ1Avb013?=
 =?utf-8?B?VDNZVjBNZWtaanl6Z096a3pZc21lUWt1NG13c0pWVVk3V0VXZTBEZVQyb1Bk?=
 =?utf-8?B?eEozL2d2QzJ0dUdOdVZYVjFhc0NBR3Z5Y1hIMmsyWmx2S21iYmo3RUxJRG9r?=
 =?utf-8?B?N3hZVXhxaS9OM3lldHYvaFRnK3J5ZU9iTVJNNEJqVUZkVyswcko3WVJsOFBu?=
 =?utf-8?B?RXEwbkNpYWI2bWNDTVViQUg1NEZPcTFLbThENVJGbTJTZGFVNW5OOFB6NUNV?=
 =?utf-8?B?UmlIakt0U0hGdy94blJHaDA3QWdZSWU3TUE0YnhEcG5VUTF0bTh6S21sS1hD?=
 =?utf-8?B?alZWKzhyRnBFZHpsMnJqZHhxek1QVG9LZXgvc2cxb3gwam4rZ3REVisxekQ4?=
 =?utf-8?B?ZisxRVdIQ0FnaVpGWTFWT0ZvU0lsWUlDVXpNZEdBM3ZZclRrNDN4blJLektB?=
 =?utf-8?B?c0haWkJLd2hub21FV2Uvd2VCNUVKRG9PdUg3M3ZkMWN2WmRCaWZ6RVlvZGt2?=
 =?utf-8?Q?Edmtk88grQ21wzoRlrkkUv+6dY4TXks7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZVIrM0NKUm9ya1hLVStvbTNpeUYzK1I0SWxvK2tDN0o4Y2dBbHpwVGJ6NVZj?=
 =?utf-8?B?MG4rN0t6NUN1UEo5akoyWUl0aXZTUEI2cVMwWVdIeG42c2FNZ1pkVGt2enNz?=
 =?utf-8?B?R2c3WlZ4VjNqcHJERzhud3RnQ1d2cTZlSFZjT0tFd3piVGRrNGdiN0Mrb0F2?=
 =?utf-8?B?ZFo5Z3V5eDd3cDlOTG1QT0F0eHNqcjlMSitsdEV3NU9NcjllUHFHcGZaZzNH?=
 =?utf-8?B?U0kyS29TWFpQYjd5eEFSOFJyN2FlTmtTOG5QNWY0S1QxQW9MK0VJSmN2RVVy?=
 =?utf-8?B?cmtPY210bkkvMUpnOGtXZWVKejEzRmZ1ZExpdUNlaHJCTE5GbkNjQzVTdDRU?=
 =?utf-8?B?UGRxUVhvcGhmSkU5MGp3a1VXcHFKOWhvRHF5aHRFV2RZN0QwMFNQSnNoTDVq?=
 =?utf-8?B?MlQwTytGS2E5T3VKcnVZTTYveWR4RUJiNnRCMEFVY08xbUhySjh3Qml0Wm00?=
 =?utf-8?B?Z1NEMHYxbnpCQVJMKysxUU5FemNRMVJkeDVWalV3UGNRYnp4UHVUaDd6eUx5?=
 =?utf-8?B?WCt4MkVjUWx6UDhmZnlLanVGOTNaeTNFdks1eFM5SVlwM3ZTQ0x3NUtQaitx?=
 =?utf-8?B?QW0wdlN0NVdoQXhUU0hLVkJESmtLbmJQZjYzSmVpTWFQNzd3YWdpNTRnQTFK?=
 =?utf-8?B?ZXhkUy9TU0hqbmg4WXlwVkYvVk1BY2RWenRwYnJ3eVIvSFoyR1piL2ttZHdW?=
 =?utf-8?B?NFprRExXL1FYbnFhVCt1REwwa3R2bU03bXl3RmFTSmdYZllwMmY4R2JCaFlP?=
 =?utf-8?B?VkEzNDFMZEtVL1pQaFBubE55Zk5xTUtQbTlMempYNVVGaGNBaVUrU2t4NE5X?=
 =?utf-8?B?N2JHMjcybDdLMmFBSXhYdzBoWEVNWFRsOFpOR1ovblZkbi84eEs5OEVDUTFF?=
 =?utf-8?B?b3R2Yk45M2M3MWExVkszRlQ3SytOaFoxZE9mY0o1V0FxTkRhNVo4bE1jb3Bs?=
 =?utf-8?B?OG10amZvekpXVVAxL2N4S2EzbUV5SG9MNkFIcEtiR1k3L29zaTlnQnVrbm1Q?=
 =?utf-8?B?R2N5VkZRV0NSdmFicm5GNXMyNFIvRXRmUXdSTkc1WUt3aUxPSDAxVWJXQk93?=
 =?utf-8?B?VWlreTB6T3BNL1U5TTZ4d1c3RjVQYU9iOTFrTHRGNkhudVlTckF1b0crUDU1?=
 =?utf-8?B?UVNqb0lmTC9GOG40OGlyTW8reWUvT2M1U0t3ZEJxNTBCVzNSVmZrQS9hMmlO?=
 =?utf-8?B?QmRQV3lwYnJrYmU4QjU3T2xJNU9QNHN6dXJ6RUwvcldBY2xhd0VZUnBteFN5?=
 =?utf-8?B?aE9DQXBaUDFFWnkwSWJQS3FjVWc5aEEzNkNTVVpoZGtqVStEMDJQbXRJaWtN?=
 =?utf-8?B?dS85WW91bTk0RkFSaVMrVHl6NHZITFFoNFJtMHA0QThtcWFCZlRMVUdKOFF2?=
 =?utf-8?B?RmpFSUZ0SlJBTW1TK3lEWDd0TmFnWEp3MFMxZFplVW9sblNBa2V3VEtVVzd3?=
 =?utf-8?B?b0R2MHJxcmhWMUN0VCtmeFdPOURkVmwwcTVvSDFNYUtFWC9WcVpBOFdtMDFM?=
 =?utf-8?B?c3FUdk44TWw5ZHhZcFRVcU9YQWZVeHVGU3BSakowVnd4aXlJQW15WXJoaWpQ?=
 =?utf-8?B?L3ByejFrcS9UR1h2UW1zOUM4c3Y0WTk2NlBwenI5NUlVekV0aEU2YlBRdlpo?=
 =?utf-8?B?bVpuejFFWjhCWlMxcFRtcytoWERmcStUZUZKRGVhSkd6VHRMSjF4ZGdINkJ3?=
 =?utf-8?B?RnNQRC90dFNzL1ZpbTAwL0s4bG1sNUs5Q1FFTzNGTjZSaDFEVXF6R0tEZEdq?=
 =?utf-8?B?MmN4OGtnQTV0dmpIV2h1SjJnaGZzb21GVFB4Yk1qMmhGc3FKcnFQSHlqOWxI?=
 =?utf-8?B?ZFM0NFB6dmVHdjJuQWQzM1N5YTF5SlkyNndHZEZEeUMwaGRScmU2RXNhLyt6?=
 =?utf-8?B?eDhwS0U3azVSeUMxMm9icSt1Mmd1bTN1aGRsdG9Cdjl5aXZBNmdLcHZEZktp?=
 =?utf-8?B?dktDVW14Y1UwQ2lUUW8yQWlRS3hwRmM1WnJLZ241eDNKNnRwcmNiUXlzdXNS?=
 =?utf-8?B?SkhGR1hmRGFibkkwSVlMVnJ4b0luN2NVUUdVWGEvbGJ2a0xodlkxaTAvcThI?=
 =?utf-8?B?OGE2Q2ZQMUM2T1BiYzV4TnNoMm9BOTg4UlNWRERFS2YzMWdZMXZQeVgySXln?=
 =?utf-8?B?M1BSYmREZjFwUGtpeWVValNrdmFUYXYrbUE0OTJkVmpEby9rN1NVdlMvNHV4?=
 =?utf-8?B?MlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: def94ca3-cba7-4d2d-7d62-08de131162dd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:24:12.8882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qt14sI+DBtYExhfVSUyxWtbMUkAHoKqwPuQcVXi3Mm6QFoUjk+0vNmIGeBcNpa3NGQEqla9OEndT0XgY8fmU/3+Fe/7tC4fWjfAo+JErvNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9218
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 15:24:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7829

Hi Antonin,

On 10/24/25 10:19 AM, Antonin Godard wrote:
> Added in OE-Core commit: 5f4875b950ce ("distro_features_check: expand
> with MACHINE_FEATURES and COMBINED_FEATURES, rename").
> 
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 27f761b72..5b8e0f7ce 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7886,6 +7886,15 @@ system and gives an overview of their function and contents.
>         the recipe will be skipped, and if the build system attempts to build
>         the recipe then an error will be triggered.
>   
> +   :term:`REQUIRED_MACHINE_FEATURES`
> +      When inheriting the :ref:`ref-classes-features_check` class, this variable
> +      identifies :term:`MACHINE` features that must exist in the current

I'm not sure we should use MACHINE here as that implies at first read 
that it's related to the MACHINE variable (ok it is at some degree..) 
instead of MACHINE_FEATURES like explained a few lines below.

Looks good to me otherwise, thus

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

