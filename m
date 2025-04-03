Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83008C36014
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 02:44:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by mx.groups.io with SMTP id smtpd.web11.4470.1743648281945264097
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 19:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=n+jW08+6;
 spf=pass (domain: intel.com, ip: 198.175.65.20, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743648282; x=1775184282;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=JYOnee3pMV1BS9G9+IbAMkpS9xA1mnH8sDtQWS3PnYQ=;
  b=n+jW08+6qTiNqOInhuSxPYLdGfFes61AHF8IqTenSXnSOePFGwb01kVT
   GopodfBJThkFZc38fC7xdO+gbL3R/K3zinz3ckcZtQM8knDL0momUlULx
   iC0u4Zk3ZX58VsJe9kuxMDtRbTsLx9BXqBrhGR/1s0QmjnaVv2W5L4Evj
   QLHP+gwyCrmkyHmJx/y7hEPGOzp9zig8KKoGwOHafv0why8qT0Y8L4q1Y
   Z/7pUu4P+c6dNuZ2ff3XaFrNeloDlEHe7EIdCACGUZdXtbM/3eooaiVFz
   k7fyyGQdavb8tf4PQ1+6GWnqDFuRTp+eLWLlT2fVhzwGbMBTNUD51bmNc
   Q==;
X-CSE-ConnectionGUID: EqPWAY+1T7C2E1K2VGKHhw==
X-CSE-MsgGUID: cG9wohgHRLquzPX77sERcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44747989"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="44747989"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 19:44:40 -0700
X-CSE-ConnectionGUID: ryc76Q0lRM6CSbGa0hnEXQ==
X-CSE-MsgGUID: ejUmYzGwQmi6WI3o4aPrJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="127371456"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Apr 2025 19:44:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 2 Apr 2025 19:44:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 19:44:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 19:44:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fnCiwZbt4yyJXi1ZmdEN0HxNC2wZqyBpywkw+QQrj+qInWhfRYIEhQzzvIatqHwM9S+byplrQTkiF0jSK/pLhQR5JGtb2sUhMUI8POT+TgiH7cM+JKXjlox14IDdO4uHKq+AJQk7cZsN1M1g4xgbm263kdgClMWoPv2L86XrjsXbtEp9wV0I/ztdt1QSNsqVNWg+FGFjWu7aEqlSV9mGikjlWD9eu66+IzriwWCVb+us1zmTxKnKYcewjLV73x7uzbN+dPWUPz+CYLzCGeYnnAJtrIPJE++jQmIV7wLuNn2PkL9kppK+qJGAVRPiSvetxJAVsihJEOTLfDegBbtaAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYOnee3pMV1BS9G9+IbAMkpS9xA1mnH8sDtQWS3PnYQ=;
 b=JfvHDo2X+ZF+xXWcJoyZgB7i40QTVLKCowSgt2Ec6j/0k+8b4vqAmvtyTjlrcHgOxg8rjrbpjJQbvouOzT02i99w4nQAnB7fo5yi9Wrw16x3ajU9Mdc0q0valFbKvDPg/uGKNSsO9MnjjFItKPgXF90KWsSNh/ZbsEWctnU8jrfdRB2fn/5OeG5x81ywCFxx9wpsal9YXXBX8LVTEwwHjMF6Itu1x1+LenrrSTxZ/HmIM+NXyMG6FWAX/p6cggnaPILHGMYBWtclnobTBDB3KliOL8LJRq8E3zDCNmUkcpeAWQHZqpwJ0XqJJwTfTwNJqYr81sae8MZ0wQ879SyCUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL4PR11MB8797.namprd11.prod.outlook.com (2603:10b6:208:5a7::8)
 by DS0PR11MB7969.namprd11.prod.outlook.com (2603:10b6:8:120::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 02:14:44 +0000
Received: from BL4PR11MB8797.namprd11.prod.outlook.com
 ([fe80::311e:565b:ccfd:f4c8]) by BL4PR11MB8797.namprd11.prod.outlook.com
 ([fe80::311e:565b:ccfd:f4c8%7]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 02:14:44 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: "antonin.godard@bootlin.com" <antonin.godard@bootlin.com>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH 1/2] migration-guides: add release notes for 5.1.4
Thread-Topic: [docs] [PATCH 1/2] migration-guides: add release notes for 5.1.4
Thread-Index: AQHbo8lx9sfefmXvsESlxC11HkWQrLORJOxA
Date: Thu, 3 Apr 2025 02:14:44 +0000
Message-ID: <BL4PR11MB8797DDDAE7797AC38FC89DBDB9AE2@BL4PR11MB8797.namprd11.prod.outlook.com>
References: <20250402041036.1025002-1-chee.yang.lee@intel.com>
 <D8W5BE1Q1UQR.20MVHMVVVH0K4@bootlin.com>
In-Reply-To: <D8W5BE1Q1UQR.20MVHMVVVH0K4@bootlin.com>
Accept-Language: en-SG, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL4PR11MB8797:EE_|DS0PR11MB7969:EE_
x-ms-office365-filtering-correlation-id: d3267698-df50-4fdd-c73c-08dd72554cf3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?alhqbnNTOExPWkRrT24xTzJzeTdtM3Y4THE1SkNqekNlbW9EQTB4Y1FnN2ln?=
 =?utf-8?B?WklpSCt3V3ZLTUFYNGFrK0FIMklEdW8xaG0wK21uVEF0UXUwRm1jZmFhRHZz?=
 =?utf-8?B?SHhVL0NyLzZVMzlCNnMwaDhiYXlmVDZmdFAwWUJndGpPc3ZyZ3lacjVkTGhw?=
 =?utf-8?B?ekdFbUtkRmJmMXJtS251VDB4eHpKR09oN0oyT3NoeVd0YUUyd0drcmFWaUZh?=
 =?utf-8?B?L0dnSHorVmZWd1lrNmF6Rlg1dTJBd2IzNHNnNGI1Q2lNKzJPQzhGVGR6N09i?=
 =?utf-8?B?bFZtYWJab0F4R01ReXB2Z0w4aExxMjBZSmtyZVM4dFk5b2lnNVpyMXRRRi9B?=
 =?utf-8?B?WXE0WkRYeGczT0E2QWhkOEV1eGlWSUNpQnJxSnFsN2pLSTBxN0RsQThMR0Uz?=
 =?utf-8?B?OEF2WUtzVnhWcWtodEJBUnZsVjZndnpyMU1CS1AwT2Z6bXNlUk5UVksyNldM?=
 =?utf-8?B?N3B0MzVzM2cxc0VRRGdtZjBaNjh6YkxvNzJDS3BBNUgwcHNia2JRakFKaXdW?=
 =?utf-8?B?T0ZUdG5rOGtZbnQ3QVNaYWtTekJ4Mld4dERWSFE4bEtZeXlrcGhOdy9UNGJ6?=
 =?utf-8?B?bTdmSjdvYlJVZXZuU1dyREFobjBuTmFyRHdJVm05S01maFJvcjlFVmQrdno5?=
 =?utf-8?B?VDlsZlhmNnMvekQzU1ZoZmdSYW9GbEJRbTB1bEM4aVlzMzF3ZUJsd3krcVBX?=
 =?utf-8?B?RjNRRVFvakFQTHhwT2hUakhoVlVUR1FMZ1ZQZ0VoaTFpRFRIbXlWM2I1TjBK?=
 =?utf-8?B?TmxueWhPUkRhNE1MZnZOWUdWQkl3TDlQM0dVcWZxOHNzZnNuc0NyNTJwMWFV?=
 =?utf-8?B?Z1A2YkUyblM1SFRHOTBzdzJENVp0TU9IRkk5SlQxczN0eGVLa21Gb2tmOHEr?=
 =?utf-8?B?MWh6eDhrY2pLdFZXT0E4eGc0OHU3dlBNeGNHY2pHZm1BTlBDM29jM2lDZmtH?=
 =?utf-8?B?cmdmMm9iSHZaTmEranVpT1lxQjdhbVk0VlcvV3g2YzVNSElKUjN4OElIa3Ir?=
 =?utf-8?B?a0ZIUjduYTR5Z1cyVkk3WGFkUkpwSSsrNFlpcGVubVBrSGRLMlFFb2pHVlNo?=
 =?utf-8?B?Q25qV2hZRzZObDJpUDJvK21jdXA2NklqSi8yTlpVWUxTOW1IZ1lQRVVqczBs?=
 =?utf-8?B?Qk1zRDhKYjRMRnloRVI0VFlHVjJqSzdza1lGWWxadmg1VVR2bEdoMUZTckpm?=
 =?utf-8?B?aHhIcysySDVrUktHbFI2WTBwZUtEclc1NjJKdlJEWXNYakdZUk1Qd1BhWEI1?=
 =?utf-8?B?MGJESXBTSnVMa0NZR3B2V2tXRjFxTG9hVlUvdzhBbVA5RTU5bTBVYkUxZXVV?=
 =?utf-8?B?NWlJVzZpa2V0YnBUcGZGdlMrMDB2aDkwKzU5Vkt5NjJpZi9hUzB5bU5JS3ZN?=
 =?utf-8?B?U3ppakg3RG5OOGdFcmh6b0QvelE1OTJOTE81NmhnUDBNeTgzNUVscjRCcnlZ?=
 =?utf-8?B?c2NqWjdPRUFBV3c5TjJFckFtUnVOQkFTc04zMkt3ZjNCTU9zYW5PV0tlM29B?=
 =?utf-8?B?VUJ0blBYNEFna0ZLNzVLdEFadk9QWWJzN2UyYVplMkY0djJadjA3MVlUYVZl?=
 =?utf-8?B?MWdObmlwdExiaFdITnZvQzdFa2YzamFhdUhVNXduY2hkbmhTUWVlZjRNRHp5?=
 =?utf-8?B?cFViNEhFNW02ZUMzb1hlSGFsR0ptckVVNk1kOXNrWXJwOCsrc3F2djQwUzVY?=
 =?utf-8?B?K1FrN0x6ZWY5eVNwUFkwUnNiUUVhblhrWWZjMHdMNlcvRTJMVUFsaGdTV0FV?=
 =?utf-8?B?empBWjBWQU4xYzlHUHJTY2VHcHBqQUhaak1YUTdNb1VhbDdpRStFRUdMRjk5?=
 =?utf-8?B?cmJuZ0NiNlJnUExZWWpWQ21QNVVBOGh1VThNN295MXdIajd2cFkxYXJMeCtK?=
 =?utf-8?B?LzJnUEl4MUdtbmwwWDNZK2lOTTA5cGZtd29teUUvZG4wRTRXQmtTeEV0c1o3?=
 =?utf-8?Q?6JmN+BLRv4h9UkSHK4Cao9gm9S4g6dAq?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR11MB8797.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bktNRmpQRkYvUVVtbWxxZEtoK0RZTnRJNStIcFUwNG5POC9MN0VMOGlxUmtE?=
 =?utf-8?B?anorVk5ib3p1UnM4di8wUEdGMkQ5WGlrcWIyWTNZUmV4Ump2dThlbm1PY3Jj?=
 =?utf-8?B?NzlUYjdLcUdhL3dBS204RXZBNFF2STVBNTRqdkFPRkZIUkszaG9HejZGSlYv?=
 =?utf-8?B?bXZSVENXdjErTFBzNUFUNTlLc1o4cEhpNFNZSkRtWWVNUlN1ZUQvYjVCTnBK?=
 =?utf-8?B?RE5QU0Zmdk5tQWpMVyt0NDZIOWtoNkNqOTdjcEdsdGF0QXVQcWdjQzVma3ht?=
 =?utf-8?B?RWt2QWZPZ0xlUS85dmtHZzJIYU9EaWF1M0hiNy8vK2FlVVZRTFgzZTZmaFN6?=
 =?utf-8?B?eFpFTFFmYnVidFRHSlpFcTduUXlObVlpTWtYTUtZblNlaFV3T2luOS9UMkNU?=
 =?utf-8?B?Y2g1WEFlcDIxM0xZbCtBL0pYUmJ2U0E0NWtrZzdJMDJTUlBMamxHWW40K2Nu?=
 =?utf-8?B?b1B2MHJHaEhrWFVNZHRhcGJhTTNucUNPZkRZaStLZTlQNVlnVTh6US9QTEpQ?=
 =?utf-8?B?QWZnWjVFUGI2ZnhpVWs5akJUYUlrS1QwYU1qc05HQTZjdW9MOTZubFZvck02?=
 =?utf-8?B?cjBDbitldGRna2ZQTHRYNFdBd2N0UE8wbkxLTVBTY2taSUNyaU4reC9ROHZ2?=
 =?utf-8?B?akhOaWtqR2RueEF6YU1xSEZPVWRJLzBuMDIxK2F3NE45WXpHN0pubzZKU3hy?=
 =?utf-8?B?RUE3dEpxbkdxaUpCMVE5VklIdGRDdzdLVDU0NGgyTmY3S2pyVEt0RVkxYVc0?=
 =?utf-8?B?ZGc0K3BSZ0tBbUIvMDlJdGRxQkUzOEY2dkpwQWVEbTFTNkNXZU1mb3pGd1M0?=
 =?utf-8?B?R2hKVHhwNFd2Y3o5VXVTVXRYQjg1L0tlQTBJbUg0dXNyK08xbTVSTVFBcjVE?=
 =?utf-8?B?SS96TWlsa01pamR1SUJSMjB4RlRmS2djNS9sUnFYbytEeW4wSjZLU2VjQUtU?=
 =?utf-8?B?OXFrTkU2elpLUXRpaVdmSU9SSC93aVNES0RwS1g5SWNaYkhaZUE0c1Q3TGJr?=
 =?utf-8?B?aEZHSDBEeUM2NHhPQ2psUGJiRjhwVzZmTC9uV0FqYnpTb3ovTlVISjdsRkxt?=
 =?utf-8?B?TjZMckRGdFJtZGk0NVpZbkhGRlgyZWZTaE0xekZ2aHhjNnlZSVlGOTRRZDli?=
 =?utf-8?B?eFU1cDZLcTB3SzQ2KzE1UzUwNlU1L0daYzBiekVTczBVNkZ1Mk9FWXc0V3pm?=
 =?utf-8?B?MC82cUpJeVBDYU9nYUUzaENJeXFyRjJ3ZmN1dmF3SXpGZm5TUVNna25ldU52?=
 =?utf-8?B?QlRHYlRUN1dpZExqQWpUdldsZEprRW9oKythWldOSExwbU9qbFUvUHhaczQw?=
 =?utf-8?B?SVArSWx6dEZBdVNCZkxSSSswYm90eXNtQ3haVjNaS243QXZQUS9SQjhUcVVn?=
 =?utf-8?B?ckE2c1Z5R2hHRlZWMzFnQ2l4cVNEYW5XM1FrRzdRZ21sc1hqcmZGR3ZYQ2x6?=
 =?utf-8?B?a0grd25lb1RJeHN6NXA1ZDVEYzQyRkNDZkxKV2dXdmQ4UEtXQkJBRWE5V2pu?=
 =?utf-8?B?Y0QrYXVxUE03Y2FvQXFRZiszaU9CSGhOSDFLNzVKMVE4NTBuWmZvTE1mbzY1?=
 =?utf-8?B?T0tEbG0wZElJWmxFV3dKLzNhRDcweU1haDVYZDBiVXd3cU1NMW5YbWZKNU5J?=
 =?utf-8?B?L1ExZGlkaWFISFJGcXBYSWk5WjV5SEpLcGJCOGZEckc4SXJucEI1eHZqOTVY?=
 =?utf-8?B?dU96VjBnRkFmdjV6ZWlKK085dTlLdmRpTTUrbnlaQWhiOGR4MFRJTmVvb3NV?=
 =?utf-8?B?ajJ3SHlONkx2bWt0SzNlT1pGSHgrQlh1Wm9mWHFPUm9pWVR0NGJNNHo2NkxQ?=
 =?utf-8?B?SnRlODAzdEp4N0xpWnpVdEVxTGsyWUROWTRwSlJ0ai9ncEViVy9tT2czTGJ6?=
 =?utf-8?B?K1FyTm5ESkJzTEVPMStlVUtBK3A2dlY5WS9ncFM2dXNSMlZ5VUpDS21JNG51?=
 =?utf-8?B?VGc5aXU2aGJMb2RoZFA1TUdweGZmY21RZ1A1aGp4aE9IT01Edkw4VHpSbENO?=
 =?utf-8?B?aE1EeGdwZklNYUxtOVdhbkJXRmNTMDVPNWtkUXZBV0tNV0RuSyt2MHlGR1pI?=
 =?utf-8?B?VVZnZldna1dCaXJVWDhGamFUcTl3cEM2UktVRmRqUVhNUFJlRW9tWjM3ZS9n?=
 =?utf-8?Q?N/2qWMdAB051ux+hIy1CoP0nE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL4PR11MB8797.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3267698-df50-4fdd-c73c-08dd72554cf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 02:14:44.5209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jNhroC0wpXk15bnRIhJFPzjwaE2JueyqhrzJ3XIW9LEwmy1pQOSGBl3SPxYUyDEvs7pxYcG9ObPZqMolTWeY1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7969
X-OriginatorOrg: intel.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 03 Apr 2025 02:44:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6700

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZG9jc0BsaXN0cy55b2N0
b3Byb2plY3Qub3JnIDxkb2NzQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZg0K
PiBBbnRvbmluIEdvZGFyZCB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTZW50OiBXZWRu
ZXNkYXksIDIgQXByaWwsIDIwMjUgODoxOSBQTQ0KPiBUbzogTGVlLCBDaGVlIFlhbmcgPGNoZWUu
eWFuZy5sZWVAaW50ZWwuY29tPjsgZG9jc0BsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbZG9jc10gW1BBVENIIDEvMl0gbWlncmF0aW9uLWd1aWRlczogYWRkIHJlbGVhc2Ug
bm90ZXMgZm9yIDUuMS40DQo+IA0KPiBIaSwNCj4gDQo+IE9uIFdlZCBBcHIgMiwgMjAyNSBhdCA2
OjEwIEFNIENFU1QsIExlZSBDaGVlIFlhbmcgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4g
d3JvdGU6DQo+IFsuLi5dDQo+ID4gKy0gIGJpbnV0aWxzOiBGaXggOmN2ZV9taXRyZTpgMjAyNS0w
ODQwYA0KPiANCj4gU2hvdWxkIHdlIHVzZSA6Y3ZlX21pdHJlOiBpbnN0ZWFkIG9mIDpjdmVfbmlz
dDogbm93PyBJIHdvbmRlcmluZyBhYm91dCB0aGUNCj4gcmVhc29uIGZvciB0aGF0IGNoYW5nZS4N
Cj4gDQpUaGlzIHdlcmUgZ2VuZXJhdGVkIHdpdGggbXkgc2NyaXB0IHdoZW4gaXQgY291bGRu4oCZ
dCBmaW5kIHRoZSBDVkUgb24gbmlzdCBzaXRlLiANCkxvb2tzIGxpa2UgbmlzdCBzaXRlIGJsb2Nr
IGFjY2VzcyB3aXRoIHNjcmlwdHMgYW5kIEkgZGlkbuKAmXQgbm90aWNlIHRoaXMgOi8NCg0KSSB3
aWxsIGZpeCB0aGlzIGFuZCBzZW5kIHYyIGZvciBib3RoIHJlbGVhc2Ugbm90ZXMuIA0KDQpDaGVl
IFlhbmcNCg==

