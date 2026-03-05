Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89CF4EF8FE4
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 13:36:33 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44213.1772717788667912762
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 05:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SdQfkuOc;
 spf=pass (domain: cherry.de, ip: 40.107.162.52, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHqhlVMbO9n1ab0RZ6mD6l0Gu/WyRVTBbKOwa5XxnvNGSSp6f75b98Cq/IVP1OcIAypQFRdoU2jGw5wWL0roKI71LoQCIgiWz/8NE1Ikc+yicIHcc1JQVSnNokcJvBV5m+TojXUA0wYInLheOiM46ROvI4Vm34BcvThByHd7DJ15RDI9FRfVyE5LzU0RJDpsFsg+i3GTZRkgUsUWW5bUFq8mF5NWNQbcICCs+0iS/Ddi6T/4JgjB6CmhhuCPC7Eiy/Y2rZsAfLdtVg2EdMDXJqv/yeh+2qXNxvEkMDo0aUBBNPi1dgFQ6ZvELfUCyrsZxGTf0brqwUq3B5YsEAiTkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6y8kTRW564nWcep71Qlj1yOaRwF/mu8wwRYnlORfIGE=;
 b=r11SVa6NlPu/3+8Zu2kh7+kt/Ek/GHftioHzfPKv64xzyOSXqvpg9s8OdXIkEAGTubdZ8SXfdgP3eR/87fQcn1LiwfTsB/BtYy3d8IZeQbZoewevjdRELcF6aLJTSjaY0IGh2SE+mzzIFmKY5RB5y3hSofQWyPpIp7pRzuiGaAQfIOkBZPFLryRDxEIz9W85LJIDkp+tKLaO8h5ITwoMT3AbTLBv5yWydKkjI/vsymACfRv9+PdhclV4Bls46ZanZmYhwRS7TZ1JHMZSknzbKEolX6TyUZjLJ77EGleV6UxhOEv/v+Nat6vUyopP6IGPX29mbxQ823YfU/HgON4IaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6y8kTRW564nWcep71Qlj1yOaRwF/mu8wwRYnlORfIGE=;
 b=SdQfkuOcdh9LXSXCaIV0AfkYFtCo34xnzA152tHPTUpM1nRdTrHkS6xI90+xGnQ/7qBwhi+QToThQZewy+R7zpDhLtV/ZrJztF4Ayhk3BWsSSkIkLu8A34gDpRcFTV8JoEwh1JqtgLndVIFZTokKNsDbC2Z8jf1AsIFHhkQAEjI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI0PR04MB10733.eurprd04.prod.outlook.com (2603:10a6:800:266::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 13:36:16 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 13:36:16 +0000
Message-ID: <fc22da85-36e1-4fa4-9a56-a66bdad4bb61@cherry.de>
Date: Thu, 5 Mar 2026 14:35:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [kirkstone][PATCH] ref-manual/system-requirements.rst:
 update end-of-life distros
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
References: <20260302110446.132075-1-antonin.godard@bootlin.com>
 <20260302110446.132075-3-antonin.godard@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260302110446.132075-3-antonin.godard@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0056.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::45) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI0PR04MB10733:EE_
X-MS-Office365-Filtering-Correlation-Id: 786c100b-c5d0-4a6b-0e1c-08de7abc2ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	MDrvkFiAqt1ksbQC5o2XR333OWV/l0fLXe3dhCjGU2lxIkbjd9yLkAzLXzLSApcErcBkuhd2odwCiSIrLtFi1Mvls5YsiJjarxbdLa8YDfsJkcEGSg90Li18DBdsEkAjC8c5KJ1y0F7AnUb6N4my+iFOL9SUT8VwpzHVV6yIvnKAvFmOr7oZfv9Ri2B92rwd0LAtN7tWjER7TcUDx9IRaiJlqihIVS1eVu7gDsd3HtyDafOAJTAPLpm00v8wYDYjQE30CseQ4sVpW76FQi+fC3Kgp6PfZDre0GmFdGa6EMEC1NnoQsUjegjsJbbBVbHgaQVoeNt9uKFlAUprOtNp+Kp+1/AkJnkzJognzR/ZRXwQxIGS9j/7GKR1uaNKbcim8829AXFokp3mD2OUEdXS9VeiS3cmuOpyi1pR7XGNF+9VBSxbGjKzVRncyvyZFdoEwEilDdQsLztGKcO/MOO7cc4FmIvkYQs59+a3fzR/uunAdVNvKO3uF/0Vw+dm4UKJ/CIA/aIbd+BxWq3MmKoi8quM9SOkVjtVw8lJ2qHDWl8+iMSVduk5fq4OU8NO+Q1Zix2GPPw7Mx+vPk3W8KkPGy8axEN/3jvRj6usxZyGvA+Rp3AUo3cCndAWKNDYCV+keX4RtEt2zcOvzsZw2CQvxtoH/IhiSG07RNnG03oCQd5yr2Em5455RdioHuC2fYn5Bv0qRDTogbviIeqXxlyekPJzvu9YrQYvOqQBaWF4cOU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L0I3ZWJ3a3lCaXhxUnZLbTlsUVB4bHhxSHo5RVNwTEZYdnpTV3NkczN4MDR1?=
 =?utf-8?B?OThXY2FUVjRYT3dGK0pNUXY4TjQzU2Q5a2lRS2hkZkllWFVGVTF6eU9uSDdG?=
 =?utf-8?B?ZjVTVWFCYlR1VW9SZ01VYnVPcHcxWTFLUWRZejgxUnZwWW9oTW85RjFEV05q?=
 =?utf-8?B?Z2hGelYraUgxTHlPL0pWRHZxck52QUx5azk0WGFpSVFQTHdqUW9yRGlpYmlI?=
 =?utf-8?B?cnAyUXAzOHBWWWpsaCs3WTA0aG85eDFzd0xLcG5rTlR3WHFwcW1zRkllZjMr?=
 =?utf-8?B?V2pZL25tWEZUWC9lWE5iRFpnY3R1cjRGeEY4K1VOK2NjeUJwaGxadUk0RkxX?=
 =?utf-8?B?aVNLbkwzbkVHaUVSUzlDMyt3a3NoUzdyTzF2SC9vZHVIVHUwQ0xMcEQvMjZ3?=
 =?utf-8?B?cGZORnNOZHc3MkpOclZYNFVzRTAvcDFlNThIdUdCU1lBUjBtMGhFM0dTU1ZE?=
 =?utf-8?B?alpFZW9RdXd0Y09DcTdxQjNsUTgrZFV2MUUrcElXYm4rdFlEbGxJL0ZnNlRR?=
 =?utf-8?B?cEdaTHROMUIyTFJCMDRYbmFrTGhOK2JzMmE2YlZaMjFtNkNvQmV6SktORXJu?=
 =?utf-8?B?SFNGbzU1cmtpU1RZUzlLM1p6VXFVSDZuNEJVZHRCOE5lWjNRU0N2WGdkYWNn?=
 =?utf-8?B?Tm9MWlJDNU1ERDFnVmVuOFUwbHVoU2lkRDdId0V6K3JlWXpPcjE3VTZRVXlJ?=
 =?utf-8?B?aitHRlJWUlhFQU9rdmplR0dXVlBFMUNqKzFUckhjYVphQWx5bFlEVlBlSjU5?=
 =?utf-8?B?UnBzY1ZrNHVDR05vN2FsNEsrYXpiUnlHUmJhUXkxTGNjalZyZHlNczl0WU55?=
 =?utf-8?B?WjlOTTBsTDR0aWw5ZWxhREo1dlloOVFlM1RZOFpaYkFLenY3UVhKWThIYUdO?=
 =?utf-8?B?VXZwcloxS2F3dnRKbG9YSExKdFJHU3RzL0pxR3N6bEE1Z3ZMclpkWVVQOWZF?=
 =?utf-8?B?NFJaZTg4TlNPb3NCdHp0VGg1MmtTVldKUzJOc3hoNWxXNVNzSDA0aTI2UXor?=
 =?utf-8?B?S0xkVlh0aFlVMW9GelUrVS8rV28wblhPalArYUdMV1FkMzBROFR4eHI3Q0VR?=
 =?utf-8?B?ZWVOVUpsMzVzOTcrMTU1VVJhMTR3enAwVDJRS1VidWJaODM0cG5zeGxTUG1s?=
 =?utf-8?B?bXZtWDFybGVnb2xOSXgzTkQ5RUJnK1kzUlBid3I1elRvWE9LRWNzb1lKUnFK?=
 =?utf-8?B?TisyMk9USVdWb2U4UUVudm83QjEzVFlIWDdSaHFpbFErK2VtWG9OaHJUdWto?=
 =?utf-8?B?R09wTmRrQlFiK2QvMGd0Rit3SkZmRis4a2c2K3NWMGQzbGZnVFBUVy9PaTd5?=
 =?utf-8?B?dDFUSE1DcHFhRzYrRG9DRFV2Y2VUR1NDSlJxR2RtWUpRbWpUQjlNVmJzYXFX?=
 =?utf-8?B?T0RDcExWc2wyTWZYWWQ5VE9kNnF1bE1PeFpQTGVuQjFHTXdPL05vRGljaU1O?=
 =?utf-8?B?cEc4cDlUVC9yMldmdHlCWFFsallPZEJCbDFJcUc2VVBOeCtlVllPa2NwZi9V?=
 =?utf-8?B?MkpDOTZKblRzTGNRVmpVSytQZytnMjBvNjF3WXJSdDIrakVRRnNaYk1RTzZk?=
 =?utf-8?B?ektGejVqYVlGdDM2cU5tdy9IekJBMy9tVmdmRUZmd0VrRVYwOXBWa1FvM1F0?=
 =?utf-8?B?ZGtIZmFCNHduNFRpZXpGek40WFZIUDN0dDVuNjloMDhZQlZybm9sNzZYQy9V?=
 =?utf-8?B?RzNWRHVkcDlReWNZdk9ieGVKM2FJMGZFdmg3azlMSTBKcEM1SkJhK1R0UElD?=
 =?utf-8?B?cGtSWXE2ZjI3bW5zQ1c1aytIaTJzcW5YMFVyNUt5bFZGMEhSRHQrNlVXZzUz?=
 =?utf-8?B?c2laUE9iVDNWbTA0MU50dklZSDJ5UTFqZ2dRUkZGZDJ4WnVVWnMwYnVNcCto?=
 =?utf-8?B?MTFGR3pSVXZ4eVhGdDRldzRIazRtQUt6MnVuUFZDeHJjMUVmQlpYY21ac2xa?=
 =?utf-8?B?bXV4MXU2R01QQTNiUEIrTG54UVZhdVJQd2U4Ti9ZRFlNd3ZwVk5MbDNLK0ZF?=
 =?utf-8?B?a0ZoblJpZ3laSU9CS2NuMmt6NHgvckxjeXJ3K1Q4SW1hTWI4b01LR1RHOW8x?=
 =?utf-8?B?TkxxdkNmSkEvUkpSSmZjbzZIN3JyMnJUZk9RQUJ6L0VhMjJQSkZlV2pGNVow?=
 =?utf-8?B?bkpsaFhVWDBOaXJjWHBjRHRSM01nM3N4amx4Sy8yQ3czSXQ4Q0cvc0Zxc0Ur?=
 =?utf-8?B?YXBFOGxmR3dsS3FSVHFZeGFjU2p2bTcvZW5abkFkdHVlREYwa0RUTUlSWVdQ?=
 =?utf-8?B?Unhwb0thRzc2VDRVM1NYWEtwZmJuK1FsVjdZdVdMdFFzY1ZMN0hVQWZlcHBy?=
 =?utf-8?B?bkM0RVZpaUtQTnM4V3dCSFVDckd1eUphVGJBMm14ZUw2UWIwZEJ1QUVNd2Fx?=
 =?utf-8?Q?Z3+go/N5nXJ84LXnr4aubja9cHOhm8aq0JDaL?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 786c100b-c5d0-4a6b-0e1c-08de7abc2ce1
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 13:36:15.9422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iS3RrbE6ho6Gz49X3jL0zP01BTGW7s+rBNbjnadLVyC8o3/y6Mzs/oMd54uvKUbje9qvcLi/whYjC5YEwLg/xpzJZNFcwUNWfHgi6gDBrlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10733
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 13:36:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9072

Hi Antonin,

On 3/2/26 12:04 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Fedora 41 was made obsolete on 2025-12-15 [1].
> 
> [1]: https://docs.fedoraproject.org/en-US/releases/eol/
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

