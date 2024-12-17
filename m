Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCDDE7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 12:58:28 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.49])
 by mx.groups.io with SMTP id smtpd.web11.80847.1734440297470352520
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 04:58:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=HDjC2QD/;
 spf=pass (domain: cherry.de, ip: 40.107.105.49, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LnakDox/Rfcrlt/TarZE8Tvvy9OxOqOOjSDlX97BE3Sv6Nt56LoFnuVUkZtCYtOkyi6tct8cWGZ/bIhk4ZhkAWx377l+pZYn3rqOLdYRDcCSXiy30/83dLzLY/AqMCLW9h4kyJE4kPHZT88a0pkOYdEbqpRdZ3ta1WW7aPhS8m9IBEvtUPZV3fl2tquP7VvsapcueWTmp/Rmn4jQLg7b8TA/Mo8QwQeUW4YXjTSzeZ1yTuCNc2iGt766ambKwhwczTzPxk2SN5xlvIAYoXA26vg51w4G4Qg0nl4TxqCSlwFqQBSSjhEKXecmFBvICZ7GkQw/taSNcWWC5c5cJdl02A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S21AVMbHXsBt8V5fbwf1BrCicHZmap0FFP5MMGwhDNw=;
 b=blYY/GFE53/Z6Ooc+xwI/2I0jkx7VxT6G9DCvSPuKtzrIq4JHgZG1Lgc1zC7/EN3jBzt2Tw6lW9pVFuUMV56V6PuM1SV3cChgnCqjXoQC8TiThZTOUV6GUSTEG+lOQHpKlZfVuDFBpzJ+/luVWW/pXlDuL3lfIgIRiz3lxtDBy7YTy6EDO4/Nd7QBMDXD8VWk19MoUzKW4AkQkhFnxm29kIgqq0abYBUGSm7n3uV/XBjEkpIBiclm7r4SP84pMeRifaiSGnplSLP2bY1jw+DXa/HETqvHhG16Hf/ALLKhcANh3qlYo5X4tfUDFEvvHCpEwQT2/XWP/NVxM0+1LLRgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S21AVMbHXsBt8V5fbwf1BrCicHZmap0FFP5MMGwhDNw=;
 b=HDjC2QD/tjDyhHV7IwkAj2CWKDFuuZd/xHY+xW5xW5gJt/uYCDFnTiDyTc1/TEdcyENjqMRuSd4tHUW4U9EVBkHR7yDTClM/tjI4AgzNFmsK+iKw0HkrQsOfhuc0ckh2cNLBgc/BZS1wiTbYL3xATIY9JKn9d2TZdep9yO1M2zM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB9000.eurprd04.prod.outlook.com (2603:10a6:10:2e3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 12:58:13 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 12:58:13 +0000
Message-ID: <e016927a-2ff7-4368-8681-80087b151b81@cherry.de>
Date: Tue, 17 Dec 2024 13:58:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH RFC 1/2] docs: use literalinclude for system
 requirements
To: Antonin Godard <antonin.godard@bootlin.com>,
 Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20241210-instructions-shell-container-v1-0-6a7cdc404ff4@cherry.de>
 <20241210-instructions-shell-container-v1-1-6a7cdc404ff4@cherry.de>
 <D6DWNEOPVATF.2H2X15PIOPKK1@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D6DWNEOPVATF.2H2X15PIOPKK1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB9000:EE_
X-MS-Office365-Filtering-Correlation-Id: e16ab66d-b249-4a4e-c69d-08dd1e9a76e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bWV3Z0FHNzB6eDQrUkdyK1hVbWpGSTEra3BDSnJzK2I4UDkrRU4xb3NRWXds?=
 =?utf-8?B?NXJLeG1kRXpTSG9TWUZIdTc1Nm1CTC85TTQ4TGpCMjcxRU9wV0dJZW5MalNO?=
 =?utf-8?B?TzRqUlJxZkwxaDVua2ErK1Q5WGxkbE9WMkFsQnovMlU0dnBCaFNFTFIxRTBV?=
 =?utf-8?B?TmJSWjNjS1BGWkpUQldWVUNzZVBPbmZaenRvVmlEUTZhaXRTcTQvY3RFbUF5?=
 =?utf-8?B?Zzl1VTA5Qnlua3ZidGd5RkIxQnh5dytEaVhRUkxHSzBvS3hVVVA1eTM5NTY3?=
 =?utf-8?B?SHloaVVCOHFob2I5cVBTcFJXUktTdHRSdUE5ZURlck44UUxoMzFFMXZrSDdO?=
 =?utf-8?B?dU5NTVdETkdxVXV6WUFzQnJHTU5haHhmc0ZsaVZDMUVUNGY1SUNreXlpM3NW?=
 =?utf-8?B?YXBUQW9ieGx5K0FQbnBRZ1BkSFluejdkcGI4VS9XQmRhSisyMDJrdnZua3Zt?=
 =?utf-8?B?TkFsQkZrS0ZnZVNQOEZkYjd5Tjc5RUhuTmJINUtZMk9hMTNGazJoQW4yK1Z1?=
 =?utf-8?B?WGROOU9GUHpkb1FlZDZQN04wUHp5eWZicnRVR0cxb3diaXZuNmwvTWZwNjE1?=
 =?utf-8?B?VXkyYlJOQ0l6NHdSMUUvbStIL2RvSStCbEJaR1dtdk9FZFlWZ28vT1VSWng5?=
 =?utf-8?B?K3dzcHQyWXZ5clRpNHJBazlOQTIxcm5uSVAydnpMTzFLeVJQUGN2MXV2ZjdY?=
 =?utf-8?B?SGdXZmZ1SEdoaEdGVmhxNk5OMGdveFA0dTFSejc2RUw0RXJnZUhQRHBYbXVO?=
 =?utf-8?B?enhDMmtSZnc3ZElEY0t5RGkxWCtzKzd4NnIyVDZnYU5LbW1BdnhCcXdWMFlH?=
 =?utf-8?B?Qi9kdnRBZThnOGx6cWpoODF4VXJkcmJHd0FZNTk0TUFnY2x5MmZjeHpiZHR3?=
 =?utf-8?B?UGhHM3R4b2prc0prMTRIemlLZXVjNkFNN2wyTyswQ0kwODNCYXFPUnNlWkdJ?=
 =?utf-8?B?Q0IrRmpKVUcvZEdUNERyS0tyeVdVdzE2V0lZZEhORW81VkF4M2dOT1liSjBL?=
 =?utf-8?B?N2VBcE50anJFaDYzVFlQOUpMUXZoclM1TFg3UjZwK1JEcUhQM1RYbWhkblA1?=
 =?utf-8?B?RExiRlJ3MWppRS94Z0ZiTjVoZjZxb1NsOW5WT2NDQ0JmZkE2RisxUVdaWTl1?=
 =?utf-8?B?dE1XekdJRi9DR2dzcDZXTklYYlVjVzZ1QkV0V0pmakVmM3BIcHg5VTY0L0xM?=
 =?utf-8?B?VlBwZ3FuQ2VhVHROaFV3RVBrWmRyMVJXTURDWWhMalpoWExNWnErS3Z3enNR?=
 =?utf-8?B?NzBwclpOVTJMK0RKWDFPcGR1KzFpZlJVNytGR285V0hnNk4vek01SW1xMDFH?=
 =?utf-8?B?WFFWbTNDbXozRzRob0ZuOGFsWGJSV3h3UGY0OGRUQ2wxaW9xd2t3VnhlUkUr?=
 =?utf-8?B?UHlhMnJOUDJnYWQ3UWNHbTQ1cWNBUGtLVnl4UTFTQ3Q3T1dka3JTeUdraHV2?=
 =?utf-8?B?bUFlYUVHNk96RXhVNld2RjdzVU40eUhsNXVxMGNiNXNiS3l5RFBZYjdyS2VU?=
 =?utf-8?B?K3dJMnc4ckE4VGdtd3BXZW1sQ094STVPV3U4RFJETC9sWXJ6V2t6THJ3dE1a?=
 =?utf-8?B?UXZMTkFZY0dobmZIbVNvOWJ1cEFRWDFjWlV0QTJ1T0ZNRXNMWnZkMUhrU0R5?=
 =?utf-8?B?S3YrOUxNNXBBR2EzWGJDSVBybTdheTlXUkQzN1luM1dkSk42SUpMZUR2dzc3?=
 =?utf-8?B?bEVvbG92T1JoUmtRblloamhXemVNdkdpMTUxSmUvbERpK2hYN0MzcHlqVXd4?=
 =?utf-8?B?ZS9xd3BLOEFUeWNPYTExQ0xaMVp1TExvdXJFOFRTMk5EaDVkRVNsdGVmS0VE?=
 =?utf-8?B?Z3RibEI3dk1JdngrYmVCVXVzdnlFWW1RVlVveWZ6SEZnWWZFQWlhOUhzZ3ZB?=
 =?utf-8?Q?oZv1Jgpk8s4M9?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U0lUbTdnaHRjc0dHREg2ZENBdG9JcFBBWU4yanZ4RlQzbmZ6M0FyRUs0aXFD?=
 =?utf-8?B?UEJHMUU2WE1hYjhXRzFFT0VNM1lMMjR6Ym9wWjVmSHBFaDFlbTA0a2dnUmdP?=
 =?utf-8?B?Y3k1aGVYRHBXTXl3MHNKZCt0bitlNXBxSGxINEZUd2lYSE5IVlo0NEh5NlBF?=
 =?utf-8?B?WnZ0WUQ1L0t3WkIwb1JZK2ZOc1pDS0RUSkFESTVQNUc2Q0VHNzhuc2paT2Vr?=
 =?utf-8?B?enhXUEVvTHlGWUd3VEVxam5MTUZRN3FuVTZUU3BVVXkyWUUvQnFiZGdGeWxJ?=
 =?utf-8?B?TSsrclVhbW1zSjI0K21XUHR6N20vNUJXMjlFblNucTFxc2U1Si9yWk5Ib2d3?=
 =?utf-8?B?U1QxdHVOTFhXKzZ0RDhNTFhKcTFERk4vUmhncXQrcTIyWG5XQlhwTHJxRnBZ?=
 =?utf-8?B?SXh4d3ZXalVsV1RUNHRuMEdwUnNEY3JvVlA0SWJkMVlHTklicHJxbnFncDhD?=
 =?utf-8?B?dExMODgzYk1GdGhjOUY2aTJsdEVLQXl3ZDhqRFBGcmt2ZXRwaEEwSU1zd21o?=
 =?utf-8?B?c0JFdlgyMjY1MW9ocmQwSkF2M3FBcVgreWxScjZaeWhRSWFXSmxHSUFIVGVp?=
 =?utf-8?B?OUdXNlNrSWY5TlNndTU2Qzl3ZnB3Sk03Wk95WXIxdXdjVnpVT1NPa3V4VjJH?=
 =?utf-8?B?YkszZHhaRTdoa1QrQmU5emt6NWlReHZWTmNzWVkxTzVFS0VTNktIM042aks4?=
 =?utf-8?B?YnhqMjJNcjBObWxIbmplY21GUDFBWjFZVWNhR3BjZ0ZmMDU3dzd5Y3NGS3BI?=
 =?utf-8?B?ZHRZamN1NzhDL2ZXSEdRRCtlbzdldGtIR0NBajZyY1FnRWdFZHpzY0lybHVv?=
 =?utf-8?B?UExiQWwyNkxqYkt3N3JKdXIwNW1sTjdLUlFJUXJBUy9iVC9UbkY3d3o0a1dx?=
 =?utf-8?B?ek9BaEF1WTZoSkdScGJlMXliV21RdUcvQVFpQ01peHZCNVptKzF4dFBJckJD?=
 =?utf-8?B?OUZPTnV5bVF6MFNKSWMrT1E0VGp3dUpoRXFOY2dOdEw0NkFKSCtYZGhwOHlG?=
 =?utf-8?B?Zkkrait0Tk80SXEva1F0NGhyK3lFZklWOTgvbkd0NVhiam11OUxZMENDSkhB?=
 =?utf-8?B?Rm1nQnVML09pUUFaRjgwajFvRzZnOURFd05yWHhQNjIyUll4dXZmMThVVkN3?=
 =?utf-8?B?RW1iTGdZQzhaMHdwWWdaeTJJN1hGSWZaK3VVa2VlbUl4K1ZLRUdqRkJTZlpY?=
 =?utf-8?B?TEFjYngyT3EyWnEvdkY3R1RTanFoc2g1UVdycy9nSGRLcFB1T3gzaDBZTDRS?=
 =?utf-8?B?MXErL0FuaEhGUXF2MC9LaDZSRTdwNUlaaFZtVUtaeW1NM0Q4VS9GaTFzRnBo?=
 =?utf-8?B?cVAranpocjV1WnNlTDRwMFpMU2NSbVZuZkJPVU02THQrb3lQa1VrQTZBeGVo?=
 =?utf-8?B?RTh3MEJoWjRSLzhDL09PV0dDTkVTaDd3QSt0eDlud1BmMFBMN0ZKSy9QcGdy?=
 =?utf-8?B?dW50cFI2RDEzVnhLSUlBMWdQS0RrQTJITTZtZjQ1ZjQxVjNlV1RRYmN1dTVG?=
 =?utf-8?B?K0dIVjAxVTZ6bzdaQTBWRUxJRnZYai96R3ZOT1M3UVdYQVRaSkIyQm9qU0RQ?=
 =?utf-8?B?ODNXdVBpME1TUHZSVzlDcGpKdVE1UmVyOHVZWDFsSnBmU0pmOGcwWjJrNldS?=
 =?utf-8?B?bWRqa08rUUVpc3UyeUpQcmxZSENqTjJoY1NTNmxwUkZOQ1liUG80YnEwbUhh?=
 =?utf-8?B?cmZBb0JOMTRaK3JqZ0tBaU5XbUhtdWtSbXpjcmxBc04vSkJDbHNrdW0wR000?=
 =?utf-8?B?UGx4S080d2FIYW9mcFNmV05rOEZMT3JPcWJ2K3o3eDA4WXZJazdGUjVoVnVZ?=
 =?utf-8?B?c05pYkxJUm9qNzI0c3FjQllwUGlYNEhaUmlzYUUyNXE3QkRla0YyU3NJNFA4?=
 =?utf-8?B?eE1Cd1lTUk5qQVNDamNQeWJyRGdjUG5VNzNUcm5HRjNYaXpwYzhFN3VNM0VL?=
 =?utf-8?B?dFhRSUtmeFhrczBsUnlGeGhsYnpRWkh1SHpKSitYMlplK0hVRGljTkVvSlh3?=
 =?utf-8?B?RkhXSDQzbE5MUTZnOEVZZUtscHZmeVdTZFJaR0dZYnJyWmJucXhiWjNmRVJC?=
 =?utf-8?B?aktQUVE3WnN3RWkrSUNJeTh2bDBjQTRCQzFwZ0t6Mys1L095UWJNNS9IZW9X?=
 =?utf-8?B?QnBiMU5TZTNXYUNhQktJK0E0cVRvV252SE9ESXVsWHFnem94cThyUUFnVi9B?=
 =?utf-8?B?WlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e16ab66d-b249-4a4e-c69d-08dd1e9a76e2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 12:58:13.1086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uI71/dHptdpJB2pdIGyYfXm+4M4XBS73mIq/isDjwLHAfGb+TluObsa43tDuK3Fcx5Pghto09WGiCGT0IWhBcAeVmev3NTa3n310L7hvF+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9000
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 12:58:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5961

Hi Antonin,

On 12/17/24 11:31 AM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Tue Dec 10, 2024 at 4:26 PM CET, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> The YAML variables for the host dependencies are updated by hand and
>> actually only used inside code blocks.
>>
>> It's also slowly getting more difficult to make sense of the content of
>> those variables as they are both the list of packages to install with
>> the distro's package manager and sometimes additional commands, which
>> all need to have the indentation of the block where the variable is used
>> matched. This is impossible so we just guess it's going to be at a
>> specific indentation.
>>
>> Instead, let's migrate all instructions into separate shell scripts that
>> are then literalinclude'd into the Sphinx documentation.
>>
>> This allows a few things:
>> - ability to run shellcheck on the scripts if we ever want to
>> - manually calling the appropriate script from a supported distro to
>>    build stuff (distro or bitbake/yocto stuff)
>> - use this script to create containers to do CI of documentation on
>>    different distros, to make sure our instructions are all up to date,
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>>   documentation/poky.yaml.in                         | 26 -------------
>>   documentation/ref-manual/system-requirements.rst   | 45 ++++++++++++----------
>>   .../tools/almalinux_host_packages_docs.sh          |  2 +
> 
> Maybe I would put the scripts in a subdirectory called "host_packages_scripts"
> and rename the scripts "almalinux_docs.sh", "almalinux_essential.sh", etc. for
> shorter names. Same for Containerfiles in the next patch, maybe storing them in
> a subdirectory would make sense.
> 
> If putting them at the same level is because of the build context requiring
> files to be all at the same place, let's leave it like this.
> 

Will check for a v3 but should be doable I believe.

> 
> Otherwise, this needs to be rebased and updated after the dependencies were
> updated on master.
> 

That's already done in the v2 I sent yesterday :)

Cheers,
Quentin

