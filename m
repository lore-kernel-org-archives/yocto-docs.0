Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA4BCCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:42:52 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.19])
 by mx.groups.io with SMTP id smtpd.web11.5112.1760611362041996867
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 03:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=PA8J5TSN;
 spf=pass (domain: cherry.de, ip: 40.107.159.19, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unJCc0jRCo6VxGQ1DOdKv9pHLMOxnnUFrW7Czk7gDfPOQrZ34yNH/dZySZGmRGi3J+OijENnrQk5aWDdq9TDU1y+e+Xq2O1F4lDD8sDO21D2Sp6N8Pie9+2k036Ezmtq9Ou+Ca5c7I1yVoUWjvUCoaaM9FjnzX4x2ETgMOimmW4hVjnWVqINoyfwbvRjgdiNQqDC3gyAImezL18sBk9UBX3Sz/1Z3LQNl4ZIS0mvSaphl/vYzO+Ga+sweWw6MYnrNBZep6yYSIojHvkYaTRNJ81WueZ5lGpOyfsFz9P3v15WdvgZW/JnZq5XNBNBTxmB6LIwSVjoyXl7pFTTiK4Peg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3BhSpLRdZeqzcFoASF9kpTGWxKxBAjxQtqe5yIDFPI=;
 b=UVWJyHZe1cmZupJHYs0WfZ/qwlzEvHPQhPo3a7mFnkCEOx6oxMe062AInTKkMoS0vwtbJGh30/K9LW+WffCc992tVpYNi1DKBYxI3st6Nb52QzjnIXeVKSYXL76yLnGKI7MjljkS9RRrmE71ikvJZIjvlDuCZW2W0AXCxzTlwfv6Gc2N0pkvC5ye4H16zbq8zLo2ZZ8fO8qzmF/f11vPltNwUggDSr7kc2CEKlQv5CDsINnOhr4da5h6A3wb4IooY2v6ofv9CX8UCoiNPvoeUsvnRxQdZbGD6eIPfh28UZBTHvsypkb6n21k0qan6VHkOSYv7MNb8fAUDsSRkKb+HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3BhSpLRdZeqzcFoASF9kpTGWxKxBAjxQtqe5yIDFPI=;
 b=PA8J5TSNBXFlLEDdk6ZJ1GH8r9syOYJ2GqHQQtZcuGu+jx+Vjs6sv+OmGzPWbxtIkiH0tM2x8ZqVufb7NsLKr7ySRABkaTzDLNSUnaazEeF+yVANh57iVbqeTfd+F9YWUoQ2leDXlX4aSqHHtfnD5D/E91azs9eL56Todhtb75s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB9964.eurprd04.prod.outlook.com (2603:10a6:10:4c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 10:42:37 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 10:42:37 +0000
Message-ID: <34550a18-25f7-4e9d-8914-96907016ad25@cherry.de>
Date: Thu, 16 Oct 2025 12:42:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 14/17] ref-manual/variables.rst: document the
 FIT_LINUX_BIN variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
 <20251016-release-note-5-3-second-hunk-v1-14-20f21db1f93c@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-14-20f21db1f93c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0216.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB9964:EE_
X-MS-Office365-Filtering-Correlation-Id: 7020b610-1313-45d6-fc9e-08de0ca0b90e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OG1pNUVWc3JyTDlzQkZyWjB4OUVUcnBNVG5tZjVMenVMUG4zbi9qVDZQS0gv?=
 =?utf-8?B?eUMxdEMrUWVRWWdYRjExb0NVT0ZNNTlQN2xTRUVwb2Fxc0ZJMWVmY3VTbzF3?=
 =?utf-8?B?N0E5NG9JR042NUFYTllPREdSR3JqL0lZZWNXWkxjV21ScEI3VFFkeWw1ZWY2?=
 =?utf-8?B?Q2c1OEVkcG9LY2MreGRXYURpeS9sdHVvYURtUld4ZVdtZVZlRmRGdUc3SXFo?=
 =?utf-8?B?ZG1HTTcvQjlqUWVYVEtTMk1OQU5PR2ZhUHBBUVZldmR6K0htM0xmS1V0MVhh?=
 =?utf-8?B?azJoc0hmeVNZZ042UGREemMvUVVvQ0p6dFRqY2Fia0d2L25NMDdmajZwR2di?=
 =?utf-8?B?bkZTNmlHT3BPdmZJODM3SXZ0Tnd5SlBpQTFQa1l5NnY0UXlXdENieWJVSXE3?=
 =?utf-8?B?N3QzOHR2NUkwV1FwMWxYMnZlL3BHb0FSa0E5bG10SEUvQzBtSXZDNXFKNlhr?=
 =?utf-8?B?TnNHaE1DYTZyRjhlNUVNL1VreWZMdWdsUjh6WlV6UkpVVTB3aVNUU200SGNj?=
 =?utf-8?B?dzhsQW1tOEN5OFBWZHUyVnV6cWE1bVZMb25Sam5VbWJsSGZEMHIvMVhkZ1Rl?=
 =?utf-8?B?dWt1NVE1RGNVak56WFVvdllhYXp6amdWZzhwejY0b2Zqd0FJUFVYY3FRV1Yz?=
 =?utf-8?B?dTRuWUJpVnV4empxYmNHaWUya2J3aWUxUzFScExDdGxwOHk3Q2p3bmNQMGpr?=
 =?utf-8?B?NHNmdk9kQmYyeFF1QnYvUlhROGcvYUQzVFIrL21DWDNUWThJNnNSbTI4NEFT?=
 =?utf-8?B?R1VjcjkwR2RzelZaVDdhSm1rdlpVczl2SFpyOExrVlNycG82QUFnZGhEakxV?=
 =?utf-8?B?Sy90YkJlMXl6TTJSRzlkbFRyckxDbFdpU2VkM1EwdWt2REtGampzOHZWWm93?=
 =?utf-8?B?OXlMTzMwMTdpQkJXMW8xaDl6YnI3OVRvaktvdURLNTZRaFcyam01bHdBRVNX?=
 =?utf-8?B?elFjbGJ4M001ZERUY0RwQnlCa2E2cFh2TDMwWjR4UGMwSGlHSVk1TC9SdnBt?=
 =?utf-8?B?bGw4eEovQkdrNDVYeW9scFA5RUtzZHpMdHNxaFpXY1VLeEhNMVhSeTV6WTR6?=
 =?utf-8?B?WW80UEUvcWdRYWlnK0lPM3k2NVVvR0FQRVFoNzZEOEtRVDFVMUdXZ1hlWTZ0?=
 =?utf-8?B?eEpXRExDNURsaTM1TVBxenlNaHEyY2I4bXhnRWY1bmFxNG9QeC9TSEt6T3U0?=
 =?utf-8?B?VlhXcXBLOVhZTmJOeUZOa1R2N0p0SFJVaWJHSGNKS2NxdDFKRHNNcDEvYU82?=
 =?utf-8?B?eU02ZDhOVFU2TnN5Z2x5dUNBYU9OMG01UjV6WHlGZko0VVZwOTB0Wk5RY29i?=
 =?utf-8?B?NVg1NndiWk1ibno5WVQxSktkZjNneXc0NjlUNmptMVByZnI1ZDdLWUFzdVZq?=
 =?utf-8?B?VGNzVFZEZEx5Z3owQ3UwaHE2b0w3WmY3eE5Pd1pXcHpyQlAyNDFocEVsTW5W?=
 =?utf-8?B?WkF4NXBVRm1vTTVmTFc0cHdoVEM1N21LbTIySkR4Zm0vS3JyZ3Rsc2o5M2pq?=
 =?utf-8?B?WlRNbHo4OVNxYTZxMDJNRUFndUN2dlFmQjhsd040NmRJTXV6L2tudDhwRHBv?=
 =?utf-8?B?TkdYVE54ekhqenYyVFlYOUFjMG4xd1B2WjhkTkhETXY2MGl4SG9MbUFpR0JZ?=
 =?utf-8?B?WFVkQXpVbzFIK3FOSWMvUW5ob1crR1ZjRG5FYWdxa09BSTZtck85a2tXTjhn?=
 =?utf-8?B?Z1l2TFJ6SGtEYmQrdUs3SGVmdVliazNJQUN4c0JOWndxNU9jRG42Mnlsd1RS?=
 =?utf-8?B?TFVPRFd0aVM2SzZoQVRDZ2VTTTFmdElHc1JSZi9lQ2dpdVpqM1Zxa0g5K3Y4?=
 =?utf-8?B?b3VnYmxxSFZBdlFrRC82Y3BtcitnWGNybmIxUXNkbC9kWTg5RHhQRXhjaDZu?=
 =?utf-8?B?Y29ocy9NZFNnd3ZzcHo2RVZRTzVsUFNYZFBpd2RmT2JKTERpVm1KQ1hSWVR1?=
 =?utf-8?Q?Dwwot3sGX2x57hz0sB8w8GIvbroTW28S?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?azczYW1lcUpKZm8wSXNaQjlJQ1ZvSzdhRG9WQ0NFbzR5Qy94Vldwbmk5Y3BL?=
 =?utf-8?B?Ui9VTmRURWErOXZldmF4OEpvMGtDcCtzazREQjFDT3hjQ0xacEVnYnJzUjBx?=
 =?utf-8?B?c2wreXY4RmNHclAzLzY1WHI1cEFtWnhvZDlZdTJsWHg2RUdodFZ5eHlSVXhk?=
 =?utf-8?B?WTVqTDNBelQwMnByRENBN2llMWJyMVhsMmhUREF6Qy9TYTBUYWczRXF6UHdY?=
 =?utf-8?B?b3l5amIvNDlqVGhDNlR0ekxuN1l0NVBHN1NUUTVIOVdQcUkvVEJBVnVvUnhw?=
 =?utf-8?B?Ky93ZXB0R05ZVnUyWEpyckRCOVliWnk3VHJmdms1NU42clVKdVNrcThtQTRl?=
 =?utf-8?B?T0FvWGRhQUY0ME90NGRNY3VIKzNGY2hVOHlWei9FenQyTmVucDZoVmxWNGkv?=
 =?utf-8?B?Z2ZjK0dTaVdrd0luV3RvcU5JdW9HZnByMHhkaXNVdm1CTDM0eWd0NWZVZGI4?=
 =?utf-8?B?UUt0VkxodFBVb0tHcFZFdDJPYmVnNXhFVWVxalNKYzhMbTBxMGYyWFFUMEdS?=
 =?utf-8?B?RkRLbFZkQ0FCb2lFTmRRMXBXMWxzQmdjalcvN0dDcGhmNVJjeDBoZTVuL2VJ?=
 =?utf-8?B?Q1RGNktwOGZuSUJsL2xZWG9BNkZDdU9jY0hSdmt0TGZodjZwUlNpVS9nWXRh?=
 =?utf-8?B?WE9tVGFPTHQ2cG41Qzk4cTE3MXlDVlI2RFFYUFFKOGhFd3pldEJtWFVzajk2?=
 =?utf-8?B?TmdjYnJwTllDMjN1U094b1Z1VzF0NmVkNnBkRG1oQmIxbEtuTWhkNjFLcmkw?=
 =?utf-8?B?eERRUDBvT2dZM0gxdkV4QXhLdjROb2VvV0g2Mk9heUl1RUxnSStsSWRMQks0?=
 =?utf-8?B?SWd2a0hwZVpKSlF3dHNyNkR2bWUvNjlRWnlLeko5eVh2dTRPbEoreUxuVzBM?=
 =?utf-8?B?bHg0WVp1NnpqS24ydWx2MXlMUmFjRTdhdkJxcFREc2ROcFYzRXlhU254T254?=
 =?utf-8?B?NHBPc0I2bXhJSnhjNWREOVdDYzM0OGtzTFE1ZmlaOHdFTnQxNm1iajhuNnJq?=
 =?utf-8?B?ejMrdGk5MVNMZjJ4UU9lYWdGZnV1NGlOWGlCUm1XQUZpM1JpMnVYUG1MNTlo?=
 =?utf-8?B?UTNJL3psUEtNV0ZtN2hocmRJWmZNWTV5RHJaMHlaS1hzaS9NbE1HSUZqQisz?=
 =?utf-8?B?c1JrazMrMm9ieUl0WFkrOC8rdHNFVy8rVWlyZW9UMW9MYVNycU1DbkNPSk0x?=
 =?utf-8?B?cWFvRnV4RzBlcHNwcXdwaWluOVo0M3JIOW9rNS9qODQrc09kRmUyUVBUMFlZ?=
 =?utf-8?B?bi96N2xnVzFzcWJESjU0b0RHWDZRd2NKR3FnOVZTOHBubG5rNXRRb0d4ZHVx?=
 =?utf-8?B?TW9FT1N4ZVppdTVPeHNxQVRzNmpQWDZVYWZuZTRobSt0QVR6alNlOTR5S2hT?=
 =?utf-8?B?b1hxNjRudU9DMngvUGdHVGM1bFk5V2l4Y2t5UERmUUMweFZTc2VlSWo2YUoy?=
 =?utf-8?B?cG16Z0ZJSGdSbGFVOUVRSFdwUVhYQ2xXVUd3TkMzRHRTV2tRajZaaC9oeTRI?=
 =?utf-8?B?YlpqV3l5V2E1VTJDZkNieEMrVkkxL0R3Z2dBemtxMXFYZHo1R1d4ZU4vWlFh?=
 =?utf-8?B?dXlncFhIL2NUK0kwWlFqb0xBa0N4RjFINlBtTG1DVFN2UmEyWDhFSGpEeE8w?=
 =?utf-8?B?NzkwbVJxaStnUlBMam1RZWxuZ1dEMWJLbDNPaXV1dlliZnpSMS8xaThLWGhC?=
 =?utf-8?B?NG0zQzhld2I5VTFKbWUyMkY5WXBKWUxjb1hiNTZTYWpjWm15RFR0OTJhZlRx?=
 =?utf-8?B?KytFdEFmOWN3dGI3eU1wTHBZVFU5NTcyVi9KcEwvejNmMXFmK1B6QXFVeno2?=
 =?utf-8?B?eUhuZ2V4LzhRVXMzc1dOTlR0VTV0OEIxaWpmOHcvWUVvL3pJOEpUMGIrTWJY?=
 =?utf-8?B?bFZnRVM3cVl5OW43bityUHRIVmVZOVNHRjVGL3AvUERQSnorV1IrbmVnd3kr?=
 =?utf-8?B?MVd1WUJrZ3NpdkV4Vk1kaVpwU3hQczRoZXRUaFBZSk5CdHhwblJ4Nk84Vlp3?=
 =?utf-8?B?ay9XRDBrSnpsQ0RJZC9ENUZpZWY5dDNMQml0R1hlamZNYXhYWEkrUEZ1NDdx?=
 =?utf-8?B?cGhJVmxydGdwNUNCYU9Rck9RYUtKYjVDZjdPeFZ5cyt4TGp1YXJldVUrOC80?=
 =?utf-8?B?UWYxbGtSUWxvWDdKM3Z5QmtjSGtPYmdPMGhpSWpCYWlkdW9xT3Z1YThwSjhZ?=
 =?utf-8?B?Tmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7020b610-1313-45d6-fc9e-08de0ca0b90e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 10:42:37.4303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfitO4Avp4rRoncmtjSoUDRLCQFYlCoj7PndtBUWSYLmAxTOAk0OTPX8xcdaVPcLECZp8e3hZObjMyKi5Ko/qxX8ltTvRrOYuPC5nXMsveg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9964
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 10:42:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7739

Hi Antonin,

On 10/16/25 10:54 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Added by commit d077777cbdb4 ("image-fitimage: add FIT_LINUX_BIN
> variable") in OE-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index f16ef9aae..140be47a9 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3435,6 +3435,16 @@ system and gives an overview of their function and contents.
>         The default value is set to "x509" by the
>         :ref:`ref-classes-kernel-fit-image` class.
>   
> +   :term:`FIT_LINUX_BIN`
> +      When using the :ref:`ref-classes-kernel-fit-image` class, the
> +      :term:`FIT_LINUX_BIN` variable specifies the path to the Linux Kernel
> +      binary. Setting the variable to an empty string allows use cases where the

I don't believe this is true currently.

FIT_LINUX_BIN is indeed set to a filename in 
meta/conf/image-fitimage.conf but how it's used in 
meta/classes-recipe/kernel-fit-image.bbclass doesn't actually use this 
variable as a path, but rather as a knob.

     # Prepare a kernel image section.
     linux_bin = d.getVar('FIT_LINUX_BIN')
     if linux_bin:
         shutil.copyfile(os.path.join(kernel_deploydir, "linux.bin"), 
"linux.bin")
         with open(os.path.join(kernel_deploydir, "linux_comp")) as 
linux_comp_f:
             linux_comp = linux_comp_f.read()
         root_node.fitimage_emit_section_kernel("kernel-1", "linux.bin", 
linux_comp,
             d.getVar('UBOOT_LOADADDRESS'), d.getVar('UBOOT_ENTRYPOINT'),
             d.getVar('UBOOT_MKIMAGE_KERNEL_TYPE'), 
d.getVar("UBOOT_ENTRYSYMBOL"))

See, we use linux.bin here regardless of the value of FIT_LINUX_BIN. So 
the only usecase right now is to skip adding the linux binary to the FIT 
image, and nothing else.

Cheers,
Quentin

