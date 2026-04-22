Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27B7FA1FCD
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 16:11:43 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86509.1776874299993791203
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 09:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KYdTWxAo;
 spf=pass (domain: cherry.de, ip: 40.107.130.0, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YlySCttsQ/HlACs9lQgDoWPjfgkZAbjyttYxCV6lvQYZTnZhsdd4uuznnZbZSdR84a6XYitMkEdVijAif519+vjDOqSssoUFSi7aV3Ht+5ApJzqCCowP2iW+AAwYRYGO3COfWKlDmV0RMI9RyZEIiTCBiqljM/3fhrBXdKOPxMPE9Q08wuIWOQhFR4HspzQIpe5FSFdOL9OSg1Gf3JuE6pwO8t2+iw0JbIFXmDuYxZKeKs7v0/vP9P/xAmhg5WGH5buL+AAqrirDWFneAHq97xNxD2Y4Y9ZaFp347IvutX1YBu9jk4Pbb9oqA3yCGDpFKmNwImUETQ9HVzUGSFwgsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xC23dWn5YO7vI1FaPlXGEQyLbSadpvb6IMg6owHF1w=;
 b=Ps2pt5pfrd76n+nhkUz0zhZXMdnFzj23TP7AWAkCVHYufRZAcrqCpe15lEBkIAsSMqi5/OhFfy+FWuOCY0t7fStO0vXoa9EYn1eNfhasUI/imA0rYeAFArUJNUio8nsKR0MD9R47WP7qzZ+7Xw44CjZgVcDA1Io7zVWf5d6DxmcOobFZX/O3sNyUxXr8m3ggTZaZYZGBJRxJTyJi7SUdqPP2vohvmf8o51O5NPDVHF/EPHEnf9MrfsnReZmXmRZSPH6LDsHrE1nG7sN9fqzarjV/qld2WvQB0P5JVYaMC95+jHWSv4CmLbWNYE1QXoR18zpbGcFuWzNPNpwpg0dy6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xC23dWn5YO7vI1FaPlXGEQyLbSadpvb6IMg6owHF1w=;
 b=KYdTWxAoGR8BUNLagoys8YxIJOwq+04t0Wmwtuw1LlghLxHF2w5zkEcnClTCScuGGa+SZOgg/d8qy9Mf3UdfU0pXt4K6t90RjtJY3tzKsdpSnj+EMssPVLlqLcSGohhkC/88kBaEtO48ZTEW7JvkoOOwIYd8FRJ5UoTZRU4fHzo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PA4PR04MB7742.eurprd04.prod.outlook.com (2603:10a6:102:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 16:11:35 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9846.017; Wed, 22 Apr 2026
 16:11:35 +0000
Message-ID: <7ce54901-e56b-4664-8c14-28dcc79a71d2@cherry.de>
Date: Wed, 22 Apr 2026 18:11:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] any value in clarifying PROVIDES "=" versus "+="?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <010efd6d-de6d-28b1-b195-e28c3d3a25a7@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <010efd6d-de6d-28b1-b195-e28c3d3a25a7@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1P191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::9) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PA4PR04MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: 37d36e9d-c9d8-4c28-8a78-08dea089d376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Q6bBozjTT2rG4T0BHu7ar3ihBC5BQawXzOV5stKrRQda1Ii+R6rn3Il9Tc/1YwTmu+8o4gQ0/dn4T7cok/eiW5qu96vwOMDaNQB9fCdOOv6d6PZgsbvYFICuAOaF7+mo5GTLdJX+MoeaSukIfSZn3Aqvs5GEdNJj4AxIARdDD1DNaW0hzQVxbV+05cDynsjq9roXMuEvWG4krHay5HoRY5wc+htBC1J8JOESbL/xw0j7gDzLVn20u7cAIeeX90wpukFBvO2HGOwc5v0dsErIs5+8RVNJZ2+9AQRqMTf48EWxMG+S+l/wwPH0XwS3Qgow0OqnHm2u9LBOMYQs1L+rLBY8aYTNzGnTadTHQeuN+94n1ecIP2Rx/BoljN5KGJlCBp3Tr/KvXX8eRQxFqTl2d+O601I/meoSxfsR6EyiCgmMUYa1vjuqdvjWBsmTHBkBxqepA/V2bl+FFhA/oaZygv8/rIE+grXDHdT5XBZUDaNQls8yUtjmbjP4DDhM1tX/erh3ZrL/2TTJBcRbSNAN9HtWvZE5ggDNcyAw3DE20N53kppAXNJeixLAhWDq7zBW3PdPkDD/W8BKUSh67CKq9GWirnHUD81Jj3tD8Q/rNdqKejc7vyXQPJ3gbpC+Zk8ESfRf2cHDYScelU7VMWy6sQzdfzkNzHhT1iS7q+YIsQR0CfKVSfKbmiLc9zVkS/On
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WE9aMkdZR3IwNFA2U1p1SzA2SXZISHBCWmR0aW5sL1UraEVKNnJ5eVBOUG51?=
 =?utf-8?B?YW9xOUJuMjJNdmY1QTJ4M3IvR3pqOUJkUVNKTkpmM25wREM1ZFRncnZKNTBX?=
 =?utf-8?B?SFVHQ0JpcDRxYVBscXNySVIweU9UbS9qbEhYOTYvbVgxcEZnWmx1RkFGUTkz?=
 =?utf-8?B?bTlETmoyeW5vOVdkUnBaV3JzY2tiSjlLUmU1SjBqTGZnMm9JSW40Z3lvNWRv?=
 =?utf-8?B?SzU0S0YvanltSUNWUmxEZXlTLzdQYUpzRlc1YTl1UC9JVEw0QnZuamdqQW1L?=
 =?utf-8?B?NC9nemRScjF3YUpYMkVKRGRTSFFTalFxMDRHVTFPcU0yTjlocXFOeUFUOFlO?=
 =?utf-8?B?YjBVSVBlZUNUM1c2QXAzM2JMOFZjME1Mc2J6M3ZaVS9aWncrODhUcCtvVHJv?=
 =?utf-8?B?d1FmR09VSXFmWGdmZTVOaGc4dU4zK3dlNVUvVG9sc21xUWRRUVpqZWQyc0k2?=
 =?utf-8?B?eXVJT3hmZ2FQWXpTT1psZnkzMGcrYVVBOU83UTJHNzhSWDlsTGRmVDFmQkhG?=
 =?utf-8?B?eXgyUkdqQ0h3ODYxL2h3Qm5QNHc5TzVUd2grUlVDbUozT01YWTA3Q1Y1dTlH?=
 =?utf-8?B?NWMwMzdjVHVHUS9vYk1VN2cyNUNzOG4ySnNpOE1WMXNVVWhZeTlNTENNUWk4?=
 =?utf-8?B?b0ZZTWlUMHZtMjE5ZHhoTnlTaEV1U1RZTkpoTjdyb1hmWDEwQlFqZ0ZrVVFW?=
 =?utf-8?B?QWtOaUs5V0ZJRkVWRTFkZ0FpVDhXbVhqc25aWHpEbFFITTdJbHJoUitvVThY?=
 =?utf-8?B?dWE1MklKY3NENWNsdTF1ZEFxc25zYlprQ00vVjBwZzlpdWNGYjJ1VnZFSldu?=
 =?utf-8?B?aXZFRm41YVp4cHJCSzFhV2Z6WTRBYUNsZVRLdVovMFo0WnZPR0V4V0xBS0Vq?=
 =?utf-8?B?QWVDQUNteWdRT1RIdmYxMDFveFY4RTJkQksyMGlyd0EyeTAvbWZKQkNMckhQ?=
 =?utf-8?B?QXZYU0Z0QUxWSERRcGpWeUpTenVQRjl6cmc0dFNLZXJJZm1PNjQrQnJBcVhn?=
 =?utf-8?B?RHhDMkV5cnU3NG1GazVuMHhVclBkZnlWWjdPeWZkOGtUK1Z1c1ZISU5mNFp0?=
 =?utf-8?B?c3dtdys0dEM4RWJEYXBPUHR2d1FkSENRZVhjb1NqaGFZdE40RnY3RnpuVi9a?=
 =?utf-8?B?MkJIMWd6Nk5ZMXBHaklmK29hN1hsdjI5d0FNdlZzWjl3NlU1S1A5cDM5NjhW?=
 =?utf-8?B?eXZSSzFSZFp0ZTBvK0pwblYvVnBkYkVrS0w2UnVLQTRqaUlyRndadExpREYw?=
 =?utf-8?B?ckZnUGFIcGFRSko1Z0psMUIxR01taXp1dG9Pb3RlZDNITnhja05uZE1jV1Z5?=
 =?utf-8?B?WkU3YllOWklPekdjaDBJRDZ5Nmc5aFlNU2RlS2ZTRGUzYTBDS09pS0twelMx?=
 =?utf-8?B?b3VBYkpDeHhJSWdJVVY2YWNwUW5EZlNXSjJWYnlFUUNwUnoxNzljUTZzN2V6?=
 =?utf-8?B?UjJFSnJ3YWJUcXZyUmRLSVJVU0FZdVdCZlNJMUJYbFJKcWErV2ppZnk3enU5?=
 =?utf-8?B?OGtkTFlhMDBHMllTOTZqdi8rZDlJRXBHWW1CZWlnWUFnVndSOFRaUTlhcjY2?=
 =?utf-8?B?c3dHWHJsOGdsRlE2alZaOEhUMExzNUQxWTVYZXJOZ0pzczFYWWw0LzQ0ek1Q?=
 =?utf-8?B?VlhhTkZwYXR2RVNDUWxQSDJEUytUV05xbUZWM2hXODJiWkpzKysyZEZ5aGxz?=
 =?utf-8?B?SjRTSzdFRFlWMlpPUEdxNUxSUTJrYlpTQ29YaFNxdm9nR3BaajZObDNzV1VJ?=
 =?utf-8?B?UGhhOEMxQld5SE5LUUZpVFFHMW9kWHAydDErSUl5bHNSbTFUaFE5RkhjYjds?=
 =?utf-8?B?SjRuNGt2TVVubnNISlRweFA3a0FQSGV4WFU1c3p6V0ZuRnN1V1lPNW5HRzdU?=
 =?utf-8?B?Qzk5ZXJtOXFxODJkZWJWdlhuU3cxRGxDc2w4YlRzY3g0R21CdHBMUTlwVUpT?=
 =?utf-8?B?THd1TU5tOElHclhTWEc1NWFBNENJYkxrbGNEbGphZFBoV0F6VDdVVTVmSk4r?=
 =?utf-8?B?Z2R4Y01XcjBmMVE1bE9vcVBrM2xvbE1NUldJS2JhVWd5dmhsRHg3WVRzUyti?=
 =?utf-8?B?REI0MFR1VWdWQk16cFFick84L0J6akYvNDJkOG9ySFlJNFRiSUN3V3JnUFMr?=
 =?utf-8?B?ZXhwR09PcmtUT2c2UzFpekZnU2hrUWVYc3hNT2U0U3RwLzF0S0R4SXNUR2g1?=
 =?utf-8?B?Nm1kYng0K3BTRjlHZGVFbGxTVmxOdFBHQ3UyZURQUFlub3RlZG1EQ0tJRHF3?=
 =?utf-8?B?UytFZ0cyUkN0NHlMZHVsakxFY1dwaHc1cUl1QU16dU5XdndDSjdLRVAzRENE?=
 =?utf-8?B?Vko5UzBUWWQ1aXdTRkU3M3p5MU5xYnhBSnUwTHVXRk5rTlhTM2wxdVhQVEtG?=
 =?utf-8?Q?kYADu0VGEhoWu47MWkw+msH/+mOiWire1bowh?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d36e9d-c9d8-4c28-8a78-08dea089d376
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 16:11:35.3243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hW2kEpOYod/JFWdStXG1Y2/seIfu33JUzHe5NHFqissbWe9daQ5GQF1hb/cLl9xpwI+Se2YVe/ZclZUKCx7zCQBSHZA1S7W4yKz2/R7sVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7742
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 16:11:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9326

Hi Robert,

On 3/12/26 2:29 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    i remember some time ago there was a short discussion about:
> 
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html#providers
> 
> where that section *appears* to suggest that one should use "+=" when
> extending a recipe's PROVIDES which, as we all know, is technically
> not true since "=" is sufficient, *but* IIRC, richard purdie weighed
> in and suggested that, sure, one needs only "=" *but* "+=" is more
> visually intuitive, so should that section be reworded in any way, or
> left as is? (i think it needs some rewording since that explanation
> will not match what people perusing the code will find, and they will
> get confused.)
> 

Maybe a note if you want to highlight that PROVIDES = "fullkeyboard" 
will do the same thing but we recommend people using += to hint that an 
implicit value is also available.

Patches welcome as usual. Sometimes sending a patch takes less time than 
asking whether it's welcome, wait for someone to answer and then send 
it. Also, patches have a much higher chance of being looked at compared 
to non-patch mails like this one.

Cheers,
Quentin

